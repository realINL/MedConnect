//
//  File.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import SwiftUI

struct MedCardEditView: View {
    
    var body: some View {
        
        // MARK: Swipeable
        TabView {
            Form {PatientInfoSection() }
            Form {PatientHWSection() }
            Form {DiseaseInfoSection() }
            Form {TumorDetailsSection() }
            Form {TNMClassificationSection() }
            Form {ChemotherapyInputView() }
//            CapriniCalculatorView(viewModel: CapriniCalculatorViewModel(medicalRecord: MedicalRecord.MOCK_MedicalRecord.first!))
//
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        
        
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
    MedCardEditView()
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

import SwiftUI

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
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var patronymic: String = ""
    @State private var sex: Sex = .male
    @State private var birthDate: Date = Date.now
    
    var body: some View {
        Section(header: SectionHeader("Основная информация", imageName: "person.fill")) {

                TextField("Фамилия", text: $surname)

                TextField("Имя", text: $name)

                TextField("Отчество", text: $patronymic)
            
            SegmentedPicker(title: "Пол", selection: $sex, options: Sex.allCases)
            
            DatePicker("Дата рождения", selection: $birthDate, displayedComponents: .date)
                .datePickerStyle(.compact)
        }
    }
}

// MARK: - Patient Height/Weight Section
struct PatientHWSection: View {
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var weightLoss: YesNo = .no
    
    var body: some View {
        Section(header: SectionHeader("Антропометрия")) {
            NumberInputField(title: "Рост, см", keyboardType: .numberPad, value: $height)
            NumberInputField(title: "Вес, кг", keyboardType: .decimalPad, value: $weight)
            
            SegmentedPicker(
                title: "Потеря веса >10% за 6 мес",
                selection: $weightLoss,
                options: YesNo.allCases
            )
        }
    }
}

// MARK: - Disease Info Section
struct DiseaseInfoSection: View {
    @State private var diseaseType: DiseaseType = .stomachCancer
    @State private var tumorSize: String = ""
    @State private var histology: Histology = .squamousCellCarcinoma
    @State private var differentiation: TumorDifferentiation = .gx
    @State private var laurenType: LaurenType = .unclassifiable
    @State private var concomitant: MainDiseaseConcomitant = .none
    
    var body: some View {
        Section(header: SectionHeader("Характеристики заболевания")) {
            SegmentedPicker(title: "Тип заболевания", selection: $diseaseType, options: DiseaseType.allCases)
            
            NumberInputField(title: "Размер опухоли, мм", keyboardType: .numberPad, value: $tumorSize)
            
            QuickSelectPicker(title: "Гистология", selection: $histology, options: Histology.allCases)
            
            NavigationLink {
                FullScreenPicker(selection: $histology, title: "Гистологический тип", options: Histology.allCases)
            } label: {
                HStack {
                    Text("Гистология")
                    Spacer()
                    Text(histology.rawValue)
                        .foregroundColor(.gray)
                }
            }
            
            NavigationLink {
                FullScreenPicker(selection: $differentiation, title: "Степень дифференцировки", options: TumorDifferentiation.allCases)
            } label: {
                HStack {
                    Text("Дифференцировка")
                    Spacer()
                    Text(differentiation.shortCode)
                        .foregroundColor(.gray)
                }
            }
            
            WheelPicker(title: "Тип по Lauren", selection: $laurenType, options: LaurenType.allCases)
            
            QuickSelectPicker(title: "Осложнения", selection: $concomitant, options: MainDiseaseConcomitant.allCases)
        }
    }
}

// MARK: - Tumor Details Section
struct TumorDetailsSection: View {
    @State private var siewertType: Siewert = .I
    @State private var tumorBody: TumorBody = .middle
    
    var body: some View {
        Section(header: SectionHeader("Локализация опухоли")) {
            NavigationLink {
                FullScreenPicker(selection: $siewertType, title: "Классификация Siewert", options: Siewert.allCases)
            } label: {
                HStack {
                    Text("Siewert")
                    Spacer()
                    Text(siewertType.shortCode)
                        .foregroundColor(.gray)
                }
            }
            
            WheelPicker(title: "Тело", selection: $tumorBody, options: TumorBody.allCases)
        }
    }
}

// MARK: - TNM Classification Section
struct TNMClassificationSection: View {
    @State private var cT: CT = .tx
    @State private var cN: CN = .nx
    @State private var cM: CM = .mx
    private var clinicalStage: String { CTNM(ct: cT, cn: cN, cm: cM).stage }
    
    var body: some View {
        Section(header: SectionHeader("Классификация cTNM")) {
            NavigationLink {
                FullScreenPicker(selection: $cT, title: "cT", options: CT.allCases)
            } label: {
                HStack {
                    Text("cT")
                    Spacer()
                    Text(cT.shortCode)
                        .foregroundColor(.gray)
                }
            }
            
            NavigationLink {
                FullScreenPicker(selection: $cN, title: "cN", options: CN.allCases)
            } label: {
                HStack {
                    Text("cN")
                    Spacer()
                    Text(cN.shortCode)
                        .foregroundColor(.gray)
                }
            }
            
            NavigationLink {
                FullScreenPicker(selection: $cM, title: "cM", options: CM.allCases)
            } label: {
                HStack {
                    Text("cM")
                    Spacer()
                    Text(cM.shortCode)
                        .foregroundColor(.gray)
                }
            }
            
            LabeledValueRowReversed(value: clinicalStage, label: "Клиническая стадия")
        }
    }
}


struct ChemotherapyInputView: View {
    @State private var status: ChemotherapyStatus = .none
    @State private var selectedScheme: ChemotherapyScheme = .FLOT
    @State private var customSchemeName: String = ""
    @State private var numberOfCourses: String = "0"
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var showingSchemePicker = false
    
    var body: some View {
        Section {
            Section(header: SectionHeader("Статус химиотерапии")) {
                Picker("Статус", selection: $status) {
                    Text("Не проведена").tag(ChemotherapyStatus.none)
                    Text("Проведена частично").tag(ChemotherapyStatus.partially)
                    Text("Проведена полностью").tag(
                        ChemotherapyStatus.completed(
                            scheme: selectedScheme,
                            endDate: endDate
                        )
                    )
                }
                .pickerStyle(.wheel)
                .frame(maxHeight: 100)
            }
            
            if case .completed = status {
                Section(header: SectionHeader("Схема лечения")) {
                    Button {
                        showingSchemePicker = true
                    } label: {
                        HStack {
                            Text("Схема")
                            Spacer()
                            Text(schemeDescription)
                                .foregroundColor(.gray)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    if case .custom = selectedScheme {
                        TextField("Название схемы", text: $customSchemeName)
                            .textFieldStyle(.roundedBorder)
                    }
                }
                
                Section(header: SectionHeader("Даты лечения")) {
                    DatePicker("Начало", selection: $startDate, displayedComponents: .date)
                    DatePicker("Окончание", selection: $endDate, in: startDate..., displayedComponents: .date)
                }
            }
            
            Section(header: SectionHeader("Курсы")) {
                Stepper(value: Binding(
                    get: { Int(numberOfCourses) ?? 0 },
                    set: { numberOfCourses = String($0) }
                ), in: 0...20) {
                    HStack {
                        Text("Количество курсов")
                        Spacer()
                        TextField("", text: $numberOfCourses)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .frame(width: 40)
                    }
                }
            }
            
            if case .completed = status {
                Section {
                    NavigationLink(destination: ChemotherapySideEffectsView()) {
                        Text("Побочные эффекты")
                    }
                }
            }
        }
        .navigationTitle("Химиотерапия")
        .sheet(isPresented: $showingSchemePicker) {
            SchemeSelectionView(selectedScheme: $selectedScheme)
        }
    }
    
    private var schemeDescription: String {
        switch selectedScheme {
        case .custom(let name):
            return name.isEmpty ? "Кастомная схема" : name
        default:
            return selectedScheme.description
        }
    }
}

// MARK: - Scheme Selection View
struct SchemeSelectionView: View {
    @Binding var selectedScheme: ChemotherapyScheme
    @State private var customScheme: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section("Стандартные схемы") {
                    ForEach([ChemotherapyScheme.FLOT, .FOLFOX, .XELOX], id: \.self) { scheme in
                        Button {
                            selectedScheme = scheme
                            dismiss()
                        } label: {
                            HStack {
                                Text(scheme.description)
                                Spacer()
                                if selectedScheme == scheme {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }
                
                Section("Кастомная схема") {
                    TextField("Введите название схемы", text: $customScheme)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Сохранить кастомную схему") {
                        if !customScheme.isEmpty {
                            selectedScheme = .custom(customScheme)
                            dismiss()
                        }
                    }
                    .disabled(customScheme.isEmpty)
                }
            }
            .navigationTitle("Выбор схемы")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Отмена") {
                        dismiss()
                    }
                }
            }
        }
    }
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
    @Binding var value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            TextField("", text: $value)
                .keyboardType(keyboardType)
                .multilineTextAlignment(.trailing)
                .frame(width: 80)
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


// MARK: - Previews
struct MedCardEditView_Previews: PreviewProvider {
    static var previews: some View {
        MedCardEditView()
    }
}
