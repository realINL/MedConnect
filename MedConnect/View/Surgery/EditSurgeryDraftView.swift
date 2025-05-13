//
//  EditSurgeryDraftView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 13.05.2025.
//

import SwiftUI

struct EditSurgeryDraftView: View {
    @ObservedObject var viewModel: CreateSurgeryViewModel
    @State var show: Bool = false
    @State var showAlert: Bool = false
    
    init(surgery: Surgery, viewModel: CreateSurgeryViewModel) {
        DispatchQueue.main.async {
            viewModel.surgery = surgery
        }
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section(header: Text("Объем операции")) {
                    // MARK: Тип 1
                    Picker("Тип 1", selection: $viewModel.surgery.surgeryVolume.mainProcedure) {
                        ForEach(MainSurgeryProcedure.allCases, id: \.self) {
                            Text("\($0.rawValue)")
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    .pickerStyle(.automatic)
                    
                    // MARK: Тип 2
                    
                    Picker("Тип 2", selection: $viewModel.surgery.surgeryVolume.procedureType) {
                        //                    let options: [SurgeryProcedureType] = {
                        //                        switch(viewModel.surgery.surgeryVolume.mainProcedure) {
                        //
                        //                        case .proximalSubtotalGastrectomy: // Проксимальная субтотальная резекция желудка
                        //                            return [.doubleTract, .doubleSingleFlap, .merendinoJejunalInterposition]
                        //                        case .distalSubtotalGastricResection: // Дистальная субтотальная резекция желудка
                        //                            return [.bilrothI, .bilrothII]
                        //
                        //                        case .gastrectomy: // Гастрэктомия
                        //                            return [.rouxEnY, . uncutRouxEnY, .loopReconstruction, .standardJejunogastroplasty, .reservoirJejunogastroplasty]
                        //                        default: return []
                        // Эзофагогастрэктомия
                        //Атипичная/Полнослойная резекция желудка
                        // Трансгастральная резекция
                        // Пилоросохраняющая резекция желудка
                        //                        }
                        //                    }()
                        
                        ForEach(SurgeryProcedureType.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option.rawValue)
                        }
                    }
                    
                    // MARK: Модификация
                    if viewModel.surgery.surgeryVolume.procedureType == SurgeryProcedureType.bilrothII.rawValue {
                        Picker("Модификация", selection: $viewModel.surgery.surgeryVolume.procrdureModification) {
                            ForEach(SurgeryProcedureModification.allCases, id: \.self) {
                                Text("\($0.rawValue)").tag($0.rawValue)
                            }
                        }
                    }
                    
                    // MARK: Анастомоз
                    Picker("Анастомоз", selection: $viewModel.surgery.surgeryVolume.anastomosisType) {
                        ForEach(AnastomosisType.allCases, id: \.self) {
                            Text($0.rawValue).tag($0.rawValue)
                        }
                    }
                    //                switch (viewModel.surgery.surgeryVolume.procedureType) {
                    //                case SurgeryProcedureType.esophagogastroanastomosis.rawValue: EmptyView()
                    //                case SurgeryProcedureType.doubleSingleFlap.rawValue: EmptyView()
                    //                case SurgeryProcedureType.bilrothI.rawValue: EmptyView()
                    //                case SurgeryProcedureType.reservoirJejunogastroplasty.rawValue: EmptyView()
                    //                case nil: EmptyView()
                    //                default:
                    //                    Picker("Анастомоз", selection: $viewModel.surgery.surgeryVolume.anastomosisType) {
                    //                        switch (viewModel.surgery.surgeryVolume.procedureType,
                    //                                viewModel.surgery.surgeryVolume.procrdureModification) {
                    //
                    //                            case (SurgeryProcedureType.doubleTract.rawValue,
                    //                                  _):
                    //
                    //                                Text(AnastomosisType.esophagojejunoanastomosis.rawValue).tag(AnastomosisType.esophagojejunoanastomosis.rawValue)
                    //                                Text(AnastomosisType.gastroenteroanastomosis.rawValue).tag(AnastomosisType.gastroenteroanastomosis.rawValue)
                    //                                Text(AnastomosisType.interintestinalAnastomosis.rawValue).tag(AnastomosisType.interintestinalAnastomosis.rawValue)
                    //
                    //                            case (SurgeryProcedureType.merendinoJejunalInterposition.rawValue,
                    //                                  _):
                    //
                    //                                Text(AnastomosisType.esophagojejunoanastomosis.rawValue).tag(AnastomosisType.esophagojejunoanastomosis.rawValue)
                    //                                Text(AnastomosisType.enterogastroanastomosis.rawValue).tag(AnastomosisType.enterogastroanastomosis.rawValue)
                    //
                    //                            case (SurgeryProcedureType.bilrothII.rawValue,
                    //                                  SurgeryProcedureModification.rouxEnY.rawValue),
                    //                                (SurgeryProcedureType.bilrothII.rawValue,
                    //                                 SurgeryProcedureModification.uncutRouxEnY.rawValue):
                    //
                    //                                    Text(AnastomosisType.gastroenteroanastomosis.rawValue).tag(AnastomosisType.gastroenteroanastomosis.rawValue)
                    //                                    Text(AnastomosisType.interintestinalAnastomosis.rawValue).tag(AnastomosisType.interintestinalAnastomosis.rawValue)
                    //
                    //                            case (SurgeryProcedureType.standardJejunogastroplasty.rawValue,
                    //                                  _):
                    //
                    //                                Text(AnastomosisType.esophagojejunoanastomosis.rawValue).tag(AnastomosisType.esophagojejunoanastomosis.rawValue)
                    //                                Text(AnastomosisType.enteroduedenoanastomosis.rawValue).tag(AnastomosisType.enteroduedenoanastomosis.rawValue)
                    //
                    //                        case (SurgeryProcedureType.reservoirJejunogastroplasty.rawValue,
                    //                                  _):
                    //                                Text("").tag("none")
                    //                            case (SurgeryProcedureType.rouxEnY.rawValue,
                    //                                  _),
                    //                                (SurgeryProcedureType.uncutRouxEnY.rawValue,
                    //                                 _),
                    //                                (SurgeryProcedureType.loopReconstruction.rawValue,
                    //                                 _):
                    //
                    //                                Text(AnastomosisType.esophagojejunoanastomosis.rawValue).tag(AnastomosisType.esophagojejunoanastomosis.rawValue)
                    //                                Text(AnastomosisType.interintestinalAnastomosis.rawValue).tag(AnastomosisType.interintestinalAnastomosis.rawValue)
                    //                        default:
                    //                            Text("").tag("none")
                    //                        }
                    //                    }
                    //
                    //
                    //
                    //                    }
                    
                    
                    
                    // MARK: Техника
                    Picker("Способ наложения", selection: $viewModel.surgery.surgeryVolume.technique) {
                        ForEach(AnastomosisTechnique.allCases, id: \.self) {
                            Text("\($0.rawValue)")
                        }
                    }
                }
                
                Section {
                    // MARK: Дата роведения операции
                    DatePicker(selection: $viewModel.surgery.date,
                               in: ...Date.now,
                               displayedComponents: .date) {
                        Text("Дата проведения операции")
                    }
                    
                    // MARK: Пациент
                    NavigationLink{
                        PatientPickerView(selectedPatient: $viewModel.surgery.patient, patients: viewModel.patients)
                    } label: {
                        HStack {
                            Text("Пациент")
                                .foregroundColor(.primary)
                            Spacer()
                            Text(viewModel.surgery.patient?.surnameInitials ?? "")
                        }
                    }
                    
                }
                
                Section {
                    
                    // MARK: Количество предоперационных койко-дней
                    Picker("Предоперационных койко-дней", selection: $viewModel.surgery.preoperativeBedDays) {
                        ForEach(0...180, id: \.self) {
                            Text("\($0.daysCount)")
                        }
                    }
                    .pickerStyle(.automatic)
                    
                    // MARK: Доступ
                    Picker("Доступ", selection: $viewModel.surgery.access) {
                        ForEach(SurgicalAccess.allCases, id: \.self) {
                            Text($0.rawValue).tag($0.rawValue)
                        }
                    }
                    
                    
                    
                    // MARK: Резекция пищевода
                    Picker("Резекция пищевода", selection: $viewModel.surgery.esophagealResection) {
                        ForEach(EsophagealResection.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    
                    // MARK: Комбинированная операция
                    Picker("Комбинированная операция", selection: $viewModel.surgery.combinedSugrery) {
                        ForEach(CombinedProcedure.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    
                    
                    // MARK: Объем лимфаденэктомии
                    Picker("Объем лимфаденэктомии", selection: $viewModel.surgery.lymphadenectomy) {
                        ForEach(Lymphadenectomy.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    
                    // MARK: Еюностомия
                    Picker("Еюностомия", selection: $viewModel.surgery.jejunostomy) {
                        Text(YesNo.yes.rawValue).tag(true)
                        Text(YesNo.no.rawValue).tag(false)
                    }
                    
                    // MARK: Интраоперационная ХТ
                    Picker("Интраоперационная ХТ", selection: $viewModel.surgery.intraoperativeChemotherapy) {
                        ForEach(IntraoperativeChemotherapy.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    
                    // MARK: Продолжительность операции в минутах
                    WheelPickerView(selectedValue: $viewModel.surgery.operationDuration,
                                    titleWheel: "Длительность операции",
                                    titleInput: "Длительность операции, минут",
                                    options: [Int](0...360),
                                    textModifier: \.minutesCount)
                    //                Picker("Длительность операции", selection: $viewModel.surgery.operationDuration) {
                    //                    ForEach(0...360, id: \.self) {
                    //                        Text("\($0.minutesCount)")
                    //                    }
                    //                }
                    //                .pickerStyle(.navigationLink)
                    //                .frame(height: 150)
                    // MARK: Объем интраоперационной кровопотери в мл
                    Picker("Объем интраоперационной кровопотери", selection: $viewModel.surgery.intraoperativeBloodLossMl) {
                        ForEach(Array(stride(from: 0, through: 2000, by: 10)), id: \.self) {
                            Text("\($0.ml)")
                        }
                    }
                    
                    // MARK: Количество дренажей
                    Picker("Количество дренажей", selection: $viewModel.surgery.drainCount) {
                        ForEach(0...5, id: \.self) {
                            Text("\($0) шт")
                        }
                    }
                    
                    // MARK: Наличие назогастрального/еюнального зонда
                    Picker("Наличие назогастрального/еюнального зонда", selection: $viewModel.surgery.feedingTube) {
                        ForEach(FeedingTube.allCases, id: \.self) {
                            Text("\($0.rawValue)")
                        }
                    }
                    
                    // MARK: Интраоперационные осложнения
                    Picker("Интраоперационные осложнения", selection: $viewModel.surgery.intraoperativeComplication) {
                        ForEach(IntraoperativeComplication.allCases, id: \.self) {
                            Text("\($0.rawValue)").tag($0.rawValue)
                        }
                    }
                    
                    if viewModel.surgery.intraoperativeComplication == "Другое" {
                        MultilineInputField(text: $viewModel.surgery.intraoperativeComplication, title: "Впишите:")
                    }
                    
                }
                
                Button {
                    show.toggle()
                } label: {
                    Text("Сохранить")
                }
                
                Button {
                    viewModel.saveDraft()
                } label: {
                    Text("Сохранить черновик")
                }
            }
            .popover(isPresented: $show) {
                VStack {
                    SurgeryDetails(surgery: viewModel.surgery)
                    Button {
                        showAlert.toggle()
                    } label: {
                        Text("Сохранить")
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .background(Color(.systemBlue))
                            .cornerRadius(10)
                            .padding()
                    }
                }
                .alert("Вы уверены что готовы сохранить опреацию?", isPresented: $showAlert) {
                    Button("Confirm") { viewModel.uploadSurgery()}
                    Button("Сохрнаить черновик", role: .cancel) { viewModel.saveDraft()}
                }
            }
            
        }
    }
}

#Preview {
    EditSurgeryDraftView(surgery: Surgery.MOCK_Surgery, viewModel: CreateSurgeryViewModel(networkManager: FakeNetworkManager(), localManager: FakeLocalManager()))
}

