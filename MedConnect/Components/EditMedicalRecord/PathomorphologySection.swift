//
//  PathomorphologySection.swift
//  MedConnect
//
//  Created by Илья Лебедев on 27.05.2025.
//

import SwiftUI

struct PathomorphologySection: View {
    @ObservedObject var viewModel: MedCardEditViewModel
    var body: some View {
        // MARK: Гистология
        Section("Гистология") {
            QuickSelectPicker(title: "Гистология", selection: $viewModel.medicalRecord.pathomorphology.tumorHistology, options: TumorHistology.allCases)
            // MARK: Дифферентация
            NavigationLink {
                FullScreenPicker(selection: $viewModel.medicalRecord.pathomorphology.tumorHistologyDifferentiation, title: "Степень дифференцировки", options: TumorHistologyDifferentiation.allCases)
            } label: {
                HStack {
                    Text("Дифференцировка")
                    Spacer()
                    Text(viewModel.medicalRecord.disease.tumorDifferentiation.shortCode)
                        .foregroundColor(.gray)
                }
            }
        }
        
        // MARK: Лечебный патоморфоз
        Section("Лечебный патоморфоз") {
            
            // MARK: Классификация по Mandard
            NavigationLink{
                FullScreenPicker(selection: $viewModel.medicalRecord.pathomorphology.mandard, title: "Классификация по Mandard", options: MandardTRG.allCases)
            } label: {
                LabeledValueRow(value: "Классификация по Mandard",
                                label: viewModel.medicalRecord.pathomorphology.mandard.rawValue)
            }
            
        // MARK: Классификация Лавниковой
            NavigationLink{
                FullScreenPicker(selection: $viewModel.medicalRecord.pathomorphology.lavnikova,
                                 title: "Классификация Лавниковой",
                                 options: LavnikovaGrade.allCases)
            } label: {
                LabeledValueRow(value: "Классификация Лавниковой",
                                label: viewModel.medicalRecord.pathomorphology.lavnikova.rawValue)
            }
            
        // MARK: Классификация по Becker
            NavigationLink{
                FullScreenPicker(selection: $viewModel.medicalRecord.pathomorphology.becker,
                                 title: "Классификация по Becker",
                                 options: BeckerTRG.allCases)
            } label: {
                LabeledValueRow(value: "Классификация по Becker",
                                label: viewModel.medicalRecord.pathomorphology.becker.rawValue)
            }
        }
        // MARK: pTNM
        // MARK: Границы резекции
        Section("Границы резекции") {
            QuickSelectPicker(title: "Границы резекции",
                              selection: $viewModel.medicalRecord.pathomorphology.resectionBoundaries,
                              options: ResectionBoundaries.allCases)
        }
        
        // MARK: Кол-во удаленных лимфатических узлов
        Section("Удаленные лимфатические узлы") {
            WheelPickerView(selectedValue: $viewModel.medicalRecord.pathomorphology.removedLymphNodesCount, titleWheel: "Общее количество", titleInput: "Общее количество", options: [Int](0...10), textModifier: \.pc)
            
            WheelPickerView(selectedValue: $viewModel.medicalRecord.pathomorphology.removedPositiveLymphNodesCount, titleWheel: "Положительные лимф. узлы", titleInput: "Удаленные положительные лимф. узлы", options: [Int](0...10), textModifier: \.pc)
        }
        // MARK: Адъювантная химиотерапия
        // MARK:
    }
}

#Preview {
    Form {PathomorphologySection(viewModel:MedCardEditViewModel(medicalRecord: MedicalRecord.MOCK_MedicalRecords[0], patient: Patient.MOCK_Patients[0], networkManager: FakeNetworkManager(), localManager: FakeLocalManager())) }
}
