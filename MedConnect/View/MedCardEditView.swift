//
//  File.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import SwiftUI

enum MedCardMode {
    case edit
    case create
}

class MedCardEditViewModel: ObservableObject {
    @Published var medicalRecord: MedicalRecord
    @Published var patient: Patient
    @Published var showConfirmAlert: Bool = false
    @Published var showSaveAlert: Bool = false
    @Environment(\.dismiss) var dismiss
    
    @Published var siewert: Siewert {
        didSet {
            updateTumorDescription()
        }
    }
    @Published var tumorBody: TumorBody {
        didSet {
            updateTumorDescription()
        }
    }
    
    @Published var tumorLocalization: TumorLocalizationCases {
        didSet {
            updateTumorDescription()
        }
    }
    let mode: MedCardMode
    let networkManager: NetworkManagerProtocol
    let localManager: LocalManagerProtocol
    
    init(medicalRecord: MedicalRecord, patient: Patient, networkManager: NetworkManagerProtocol, localManager: LocalManagerProtocol, mode: MedCardMode = .edit) {
        self.medicalRecord = medicalRecord
        self.patient = patient
        self.siewert =  Siewert(rawValue: medicalRecord.disease.tumorLocalization.desription) ?? .I
        self.tumorBody = TumorBody(rawValue: medicalRecord.disease.tumorLocalization.desription) ?? .middle
        self.tumorLocalization = medicalRecord.disease.tumorLocalization.localization
        self.networkManager = networkManager
        self.localManager = localManager
        self.mode = mode
    }
    
    func updateTumorDescription() {
        medicalRecord.disease.tumorLocalization.localization = tumorLocalization
        switch tumorLocalization {
           case .ker:
               medicalRecord.disease.tumorLocalization.desription = siewert.rawValue
           case .tumorBody:
               medicalRecord.disease.tumorLocalization.desription = tumorBody.rawValue
           default:
               medicalRecord.disease.tumorLocalization.desription = ""
           }
       }
    
    func patchHospitalComplication(_ complication: any Complication) {
        if complication is GenerealComplication {
            if let index = self.medicalRecord.hospitalComplications.generalComplications.firstIndex(where: { $0.id == complication.id as! String }) {
                self.medicalRecord.hospitalComplications.generalComplications[index] = complication as! GenerealComplication
            } else {
                    self.medicalRecord.hospitalComplications.generalComplications.append(complication as! GenerealComplication)
                }
        } else if complication is SurgicalComplication {
            if let index = self.medicalRecord.hospitalComplications.SurgicalComplications.firstIndex(where: { $0.id == complication.id as! String }) {
                self.medicalRecord.hospitalComplications.SurgicalComplications[index] = complication as! SurgicalComplication
            } else {
                self.medicalRecord.hospitalComplications.SurgicalComplications.append(complication as! SurgicalComplication)
            }
        }
    }
    
    func removeComplication(_ complication: any Complication) {
        if let general = complication as? GenerealComplication {
            self.medicalRecord.hospitalComplications.generalComplications.removeAll { $0.id == general.id }
        } else if let surgical = complication as? SurgicalComplication {
            self.medicalRecord.hospitalComplications.SurgicalComplications.removeAll { $0.id == surgical.id }
        }
    }
    
    func updateMedicalRecord() {
        if mode == .edit {
            Task {
                try await networkManager.updateMedicalRecord(self.medicalRecord)
                try await networkManager.updatePatient(self.patient)
            }
        }
        else {
            Task {
                try await networkManager.uploadPatient(self.patient, medcard: self.medicalRecord)
            }
            print("update mr \(mode)")
        }
        showSaveAlert = true
    }
    
    func saveAsDraft() {
        do {
            try localManager.createMedicalRecordDraft(self.medicalRecord)
        } catch {}
        showSaveAlert = true
    }
}

struct MedCardEditView: View {
    @ObservedObject var medCardEditViewModel: MedCardEditViewModel
    
    var body: some View {
        
        // MARK: Swipeable
        TabView {
            Form {PatientInfoSection(viewModel: medCardEditViewModel) }
            Form {PatientHWSection(viewModel: medCardEditViewModel) }
            Form {DiseaseInfoSection(viewModel: medCardEditViewModel) }
            Form {TumorDetailsSection(viewModel: medCardEditViewModel) }
            Form {TNMClassificationSection(viewModel: medCardEditViewModel) }
            Form {ChemotherapyInputView(viewModel: medCardEditViewModel) }
            Form { RadiationTherapySection(viewModel: medCardEditViewModel)}
            Form { ConcomitantDiseaseSection(viewModel: medCardEditViewModel)}
            Form { PostoperativeCourseSection(viewModel: medCardEditViewModel)}
            Form { PathomorphologySection(viewModel: medCardEditViewModel)}
            Form { pTNMSection(viewModel: medCardEditViewModel) }
            Form { AdjuvantChemotherapySection(viewModel: medCardEditViewModel)}
            Form { ConfirmationEdit(viewModel: medCardEditViewModel
            )}
//            Form { HospitalComplicationsSection(viewModel: medCardEditViewModel)}
//            CapriniCalculatorView(viewModel: CapriniCalculatorViewModel(medicalRecord: MedicalRecord.MOCK_MedicalRecord.first!))
//            previewMedicalRecord(patient: medCardEditViewModel.patient, medicalRecord: medCardEditViewModel.medicalRecord)
//
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .background(Color(.systemGroupedBackground))
        .toolbar {
//            ToolbarItem(placement: .topBarLeading) {
//                Button(action: {
//                    
//                }, label: {
//                    Image(systemName: "chevron.left")
//                })
//                
//            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    medCardEditViewModel.showConfirmAlert = true
                }, label: {
                    Image(systemName: "checkmark.circle")
                })
                
            }
        }
        .alert("Вы уверены что хотите обновить данные?\nЭто действие нельзя отменить.", isPresented: $medCardEditViewModel.showConfirmAlert) {
            Button("Confirm", role: .destructive) {  medCardEditViewModel.updateMedicalRecord() }
            Button("Сохрнаить как черновик", role: .cancel) {medCardEditViewModel.saveAsDraft() }
        }
        .alert("Данные сохранены", isPresented: $medCardEditViewModel.showSaveAlert) {
            Button("Ok", role: .cancel) {
                medCardEditViewModel.showSaveAlert = false
            }
        }
        
        
        // MARK: Scrollable
//        NavigationView {
//            List {
//             PatientInfoSection()
//             PatientHWSection()
//             DiseaseInfoSection()
//             TumorDetailsSection()
//             TNMClassificationSection()
//             ChemotherapyInputView()
//}
        
        
////            .navigationTitle("Медицинская карта")
////            .navigationBarTitleDisplayMode(.inline)
////            .toolbar {
////                ToolbarItem(placement: .primaryAction) {
////                    Button("Сохранить") {
////                        // Сохранение данных
////                    }
////                    .font(.headline)
////                }
////            }
//        }
    }
}

#Preview() {
    MedCardEditView(medCardEditViewModel:
                        MedCardEditViewModel(medicalRecord: MedicalRecord.MOCK_MedicalRecords[0], patient: Patient.MOCK_Patients[0], networkManager: FakeNetworkManager(), localManager: FakeLocalManager()))
}


//struct PatientInfoEditUIComponent: View {
//    @State var name: String = ""
//    @State var surname: String = ""
//    @State var patronymic: String = ""
//    @State var sex: Sex = .male
//    @State var birthDate: Date = Date.now
//    var body: some View {
//        Form {
//            Section("ФИО") {
//                TextField("Имя", text: $name)
//                TextField("Фамилия", text: $surname)
//                TextField("Отчество", text: $patronymic)
//            }
//            
//            Section() {
//                Picker("Пол", selection: $sex) {
//                    ForEach(Sex.allCases, id: \.self) {
//                        Text(LocalizedStringKey($0.rawValue))
//                    }
//                }
//                .pickerStyle(.segmented)
//                
//                DatePicker("Дата рождения", selection: $birthDate, displayedComponents: .date)
//                    .datePickerStyle(.compact)
//            }
//        }
//        
//    }
//}
//
//
//struct PatientHWEdit: View {
//    @State var height: String = ""
//    @State var weight: String = ""
//    @State var weightLoss: YesNo = .no
//    var body: some View {
//        Form {
//            Section {
//                TextField("Вес, кг", text: $weight)
//                    .keyboardType(.decimalPad)
//                
//                TextField("Рост, см", text: $height)
//                    .keyboardType(.numberPad)
//                VStack {
//                    Text("Потеря веса более 10% за последние 6 месяцев")
//                    Picker("Потеря веса", selection: $weightLoss) {
//                        ForEach(YesNo.allCases, id: \.self) {
//                            Text($0.rawValue)
//                        }
//                    }
//                    .pickerStyle(.segmented)
//                }
//                
//            }
//        }
//    }
//}
//
//struct DiseaseEditView: View {
//    @State var type: DiseaseType = .stomachCancer
//    @State var size: String = ""
//    
//    // границы ЭГДС
//    
//    @State var histology: Histology = .squamousCellCarcinoma
//    @State var tumorDifferentiation: TumorDifferentiation = .gx
////    @State var tumorLocalization: TumorLocalization = .init(siewert: .I, bottom: .localizedName(of: ""), tumorBody: <#T##TumorBody#>, pyloric: <#T##String#>)
//    @State var lauren: LaurenType = .unclassifiable
//    @State var mainDiseaseConcomitant: MainDiseaseConcomitant = .none
////    @State var cTNM: CTNM = .init(ct: .tx, cn: .nx, cm: .mx)
//    var body: some View {
//        Form {
//            Picker("Потеря веса", selection: $type) {
//                ForEach(DiseaseType.allCases, id: \.self) {
//                    Text($0.rawValue)
//                }
//            }
//            .pickerStyle(.segmented)
//            
//            TextField("Размер", text: $size)
//            
//            Section {
//                Picker("Гистолгия", selection: $histology) {
//                    ForEach(Histology.allCases, id: \.self) {
//                        Text($0.rawValue)
//                    }
//                }
//                .pickerStyle(.wheel)
//            }
//            
//            
//            
//        }
//    }
//}
//


// MARK: - Main View
//struct MedCardEditView: View {
//    var body: some View {
//        NavigationView {
//            List {
//                PatientInfoSection()
//                PatientHWSection()
//                DiseaseInfoSection()
//                TumorDetailsSection()
//                TNMClassificationSection()
//            }
//            .navigationTitle("Медицинская карта")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .primaryAction) {
//                    Button("Сохранить") {
//                        // Сохранение данных
//                    }
//                    .font(.headline)
//                }
//            }
//        }
//    }
//}

// MARK: - Patient Info Section
struct PatientInfoSection: View {
    @ObservedObject var viewModel: MedCardEditViewModel
    
    var body: some View {
        Section(/*header: SectionHeader("Основная информация", imageName: "person.fill")*/) {

            TextInputField("Фамилия", text: $viewModel.patient.surname)

            TextInputField("Имя", text: $viewModel.patient.name)

            TextInputField("Отчество", text: $viewModel.patient.patronymic)
            
            SegmentedPicker(title: "Пол", selection: $viewModel.patient.sex, options: Sex.allCases)
            
            DatePicker("Дата рождения", selection: $viewModel.patient.birthDate, displayedComponents: .date)
                .datePickerStyle(.compact)
        }
        .navigationTitle("Основная информация")
        .transition(.move(edge: .leading))
    }
}

// MARK: - Patient Height/Weight Section
struct PatientHWSection: View {
    @ObservedObject var viewModel: MedCardEditViewModel
    
    var body: some View {
        Section(/*header: SectionHeader("Антропометрия")*/) {
            NumberTextField(value: $viewModel.medicalRecord.height, title: "Рост, см")
            DoubleTextField(value: $viewModel.medicalRecord.weight, title: "Вес", suffix: "кг")
            
            Text("Потеря веса >10% за 6 мес")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Picker("Потеря веса >10% за 6 мес", selection: $viewModel.medicalRecord.weightLoss) {
                Text(YesNo.yes.rawValue).tag(true)
                Text(YesNo.no.rawValue).tag(false)
            }
        }
        .pickerStyle(.segmented)
        .navigationTitle("Антропометрия")
    }
}

// MARK: - Disease Info Section
struct DiseaseInfoSection: View {
    @ObservedObject var viewModel: MedCardEditViewModel
    
    var body: some View {
        Section(/*header: SectionHeader("Характеристики заболевания")*/) {
            SegmentedPicker(title: "Тип заболевания", selection: $viewModel.medicalRecord.disease.type, options: DiseaseType.allCases)
            
            TextInputField("Размер опухоли, мм", text: $viewModel.medicalRecord.disease.size)
            
            QuickSelectPicker(title: "Гистология", selection: $viewModel.medicalRecord.disease.histology, options: Histology.allCases)
            
            NavigationLink {
                FullScreenPicker(selection: $viewModel.medicalRecord.disease.tumorDifferentiation, title: "Степень дифференцировки", options: TumorDifferentiation.allCases)
            } label: {
                HStack {
                    Text("Дифференцировка")
                    Spacer()
                    Text(viewModel.medicalRecord.disease.tumorDifferentiation.shortCode)
                        .foregroundColor(.gray)
                }
            }
            
            WheelPicker(title: "Тип по Lauren", selection: $viewModel.medicalRecord.disease.lauren, options: LaurenType.allCases)
            
            QuickSelectPicker(title: "Осложнения", selection: $viewModel.medicalRecord.disease.mainDiseaseConcomitant, options: MainDiseaseConcomitant.allCases)
        }
        .navigationTitle("Характеристики заболевания")
    }
}

// MARK: - Tumor Details Section
struct TumorDetailsSection: View {
    @ObservedObject var viewModel: MedCardEditViewModel
    
    var body: some View {
        Section() {
            WheelPicker(title: "Локализация", selection: $viewModel.tumorLocalization, options: TumorLocalizationCases.allCases)
            switch(viewModel.medicalRecord.disease.tumorLocalization.localization) {
            case .ker:
                NavigationLink {
                    FullScreenPicker(selection: $viewModel.siewert, title: "Классификация Siewert", options: Siewert.allCases)
                } label: {
                    HStack {
                        Text("Siewert")
                        Spacer()
                        Text(viewModel.siewert.shortCode)
                            .foregroundColor(.gray)
                    }
                }
            case .tumorBody:
                NavigationLink {
                    FullScreenPicker(selection: $viewModel.tumorBody, title: "Тело", options: TumorBody.allCases)
                } label: {
                    HStack {
                        Text("Тело")
                        Spacer()
                        Text(viewModel.tumorBody.rawValue)
                            .foregroundColor(.gray)
                    }
                }
            default:
                EmptyView()
            }
            
            
        }
        .navigationTitle("Локализация опухоли")
    }
}

//struct previewMedicalRecord: View {
//    let patient: Patient
//    let medicalRecord: MedicalRecord
//    var body: some View {
//        PatientCardView(patient: patient, medicalRecord: medicalRecord)
//    }
//}

// MARK: - TNM Classification Section
struct TNMClassificationSection: View {
    @ObservedObject var viewModel: MedCardEditViewModel
    
    var body: some View {
        Section(/*header: SectionHeader("Классификация cTNM")*/) {
            NavigationLink {
                FullScreenPicker(selection: $viewModel.medicalRecord.disease.cTNM.ct, title: "cT", options: CT.allCases)
            } label: {
                HStack {
                    Text("cT")
                    Spacer()
                    Text(viewModel.medicalRecord.disease.cTNM.ct.shortCode)
                        .foregroundColor(.gray)
                }
            }
            
            NavigationLink {
                FullScreenPicker(selection: $viewModel.medicalRecord.disease.cTNM.cn, title: "cN", options: CN.allCases)
            } label: {
                HStack {
                    Text("cN")
                    Spacer()
                    Text(viewModel.medicalRecord.disease.cTNM.cn.shortCode)
                        .foregroundColor(.gray)
                }
            }
            
            NavigationLink {
                FullScreenPicker(selection: $viewModel.medicalRecord.disease.cTNM.cm, title: "cM", options: CM.allCases)
            } label: {
                HStack {
                    Text("cM")
                    Spacer()
                    Text(viewModel.medicalRecord.disease.cTNM.cm.shortCode)
                        .foregroundColor(.gray)
                }
            }
            
            LabeledValueRowReversed(value: viewModel.medicalRecord.disease.cTNM.stage, label: "Клиническая стадия")
        }
        .navigationTitle("Классификация cTNM")
    }
}

struct ChemotherapyInputView: View {
    @ObservedObject var viewModel: MedCardEditViewModel
    
    var body: some View {
        Section {
            Section(/*header: SectionHeader("Статус химиотерапии")*/) {
                Picker("Статус", selection: $viewModel.medicalRecord.chemotherapy.status) {
                    Text("Не проведена").tag(ChemotherapyStatus.none)
                    Text("Проведена частично").tag(ChemotherapyStatus.partially)
                    Text("Проведена полностью").tag(ChemotherapyStatus.completed)
                }
                .pickerStyle(.wheel)
                .frame(maxHeight: 100)
            }
            
            if case .completed = viewModel.medicalRecord.chemotherapy.status {
                Section(header: SectionHeader("Схема лечения")) {
                    NavigationLink{
                        SchemeSelectionView(selectedScheme: $viewModel.medicalRecord.chemotherapy.scheme.toUnwrapped(defaultValue: ChemotherapyScheme.custom.rawValue))
                    } label: {
                        HStack {
                            Text("Схема")
                            Spacer()
                            Text(viewModel.medicalRecord.chemotherapy.scheme ?? "no data")
                                .foregroundColor(.gray)
//                            Image(systemName: "chevron.right")
//                                .foregroundColor(.gray)
                        }
                    }
                    
                    
                }
                
                Section(header: SectionHeader("Даты лечения")) {
                    DatePicker("Начало", selection: $viewModel.medicalRecord.chemotherapy.startDate, displayedComponents: .date)
                    DatePicker("Окончание", selection: $viewModel.medicalRecord.chemotherapy.endDate, in: viewModel.medicalRecord.chemotherapy.startDate..., displayedComponents: .date)
                }
                
                Section(header: SectionHeader("Курсы")) {
                    Stepper(value: $viewModel.medicalRecord.chemotherapy.numberOfCourses, in: 0...20) {
                        HStack {
                            Text("Количество курсов")
                            Spacer()
                            Text("\(viewModel.medicalRecord.chemotherapy.numberOfCourses)")
                        }
                    }
                }
            }
            
            if case .partially = viewModel.medicalRecord.chemotherapy.status {
                Section(header: SectionHeader("Схема лечения")) {
                    NavigationLink{
                        SchemeSelectionView(selectedScheme: $viewModel.medicalRecord.chemotherapy.scheme.toUnwrapped(defaultValue: ChemotherapyScheme.custom.rawValue))
                    } label: {
                        HStack {
                            Text("Схема")
                            Spacer()
                            Text(viewModel.medicalRecord.chemotherapy.scheme?.description ?? "no data")
                                .foregroundColor(.gray)
//                            Image(systemName: "chevron.right")
//                                .foregroundColor(.gray)
                        }
                    }
                    
                    
                }
                
                Section(header: SectionHeader("Даты лечения")) {
                    DatePicker("Начало", selection: $viewModel.medicalRecord.chemotherapy.startDate, displayedComponents: .date)
                }
                
                Section(header: SectionHeader("Курсы")) {
                    Stepper(value: $viewModel.medicalRecord.chemotherapy.numberOfCourses, in: 0...20) {
                        HStack {
                            Text("Количество курсов")
                            Spacer()
                            Text("\(viewModel.medicalRecord.chemotherapy.numberOfCourses)")
                        }
                    }
                }
            }
            
            if case .none = viewModel.medicalRecord.chemotherapy.status {
                EmptyView()
            }
            
            
            
            //            if case .completed = status {
            //                Section {
            //                    NavigationLink(destination: ChemotherapySideEffectsView()) {
            //                        Text("Побочные эффекты")
            //                    }
            //                }
            //            }
        }
        .navigationTitle("Химиотерапия")

    }

    
//    private var schemeDescription: String {
//        switch selectedScheme {
//        case .custom(let name):
//            return name.isEmpty ? "Кастомная схема" : name
//        default:
//            return selectedScheme.description
//        }
//    }
}



// MARK: - Side Effects View
struct ChemotherapySideEffectsView: View {
    @State private var sideEffects: [String] = []
    @State private var newEffect: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Зарегистрированные побочные эффекты")) {
                ForEach(sideEffects, id: \.self) { effect in
                    Text(effect)
                }
                .onDelete { indices in
                    sideEffects.remove(atOffsets: indices)
                }
                
                HStack {
                    TextField("Новый эффект", text: $newEffect)
                    Button(action: addEffect) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                    }
                    .disabled(newEffect.isEmpty)
                }
            }
        }
        .navigationTitle("Побочные эффекты")
    }
    
    private func addEffect() {
        withAnimation {
            sideEffects.append(newEffect)
            newEffect = ""
        }
    }
}




// MARK: - UI Components
struct LabeledValueRowReversed: View {
    let value: String
    let label: String
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.primary)
            
            Spacer()
            
            Text(value)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}



struct SectionHeader: View {
    let title: String
    let imageName: String?
    
    init(_ title: String, imageName: String? = nil) {
        self.title = title
        self.imageName = imageName
    }
    
    var body: some View {
        HStack {
            Group {
                if let imageName {
                    Image(systemName: imageName)
                }
                
                Text(title)
            }
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.top, 8)
        }
    }
}

struct SegmentedPicker<T: Hashable & RawRepresentable & CaseIterable>: View where T.RawValue == String {
    let title: String
    @Binding var selection: T
    let options: [T]
    var firstWord: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Picker(title, selection: $selection) {
                ForEach(options, id: \.self) { option in
                    Text(firstWord ? option.rawValue.firstWord : option.rawValue).tag(option)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding(.vertical, 4)
    }
}


struct WheelPicker<T: Hashable & RawRepresentable & CaseIterable>: View where T.RawValue == String {
    let title: String
    @Binding var selection: T
    let options: [T]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Picker(title, selection: $selection) {
                ForEach(options, id: \.self) { option in
                    Text(option.rawValue).tag(option)
                }
            }
            .pickerStyle(.wheel)
            .frame(maxHeight: 100)
        }
        .padding(.vertical, 4)
    }
}

struct QuickSelectPicker<T: Hashable & RawRepresentable & CaseIterable>: View where T.RawValue == String {
    let title: String
    @Binding var selection: T
    let options: [T]
    
    var body: some View {
            
            Picker(title, selection: $selection) {
                ForEach(options, id: \.self) { option in
                    Text(option.rawValue).tag(option)
                }
            }
            .pickerStyle(.automatic)

    }
}

struct NumberInputField: View {
    let title: String
    let keyboardType: UIKeyboardType
    @Binding var value: Int
    
    var body: some View {
        HStack {
            Text(title)
                .layoutPriority(1)
            Spacer()
            NumberTextField(value: $value, title: title)
                .background(Color.red)
//            TextField("", value: $value, format: .number)
                
//                .frame(width: 80)
                .keyboardType(keyboardType)
                .multilineTextAlignment(.trailing)
            Text(title.components(separatedBy: ",").last ?? "")
                .foregroundColor(.gray)
        }
    }
}

struct FullScreenPicker<T: Hashable & RawRepresentable>: View where T.RawValue == String {
    @Binding var selection: T
    let title: String
    let options: [T]
    
    var body: some View {
        Form {
            Picker(title, selection: $selection) {
                ForEach(options, id: \.self) { option in
                    Text(option.rawValue).tag(option)
                }
            }
            .pickerStyle(.inline)
        }
        .navigationTitle(title)
    }
}


//// MARK: - Previews
//struct MedCardEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        MedCardEditView(medCardEditViewModel: MedCardEditViewModel())
//    }
//}
