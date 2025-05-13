//
//  AdjuvantChemotherapySection.swift
//  MedConnect
//
//  Created by Илья Лебедев on 27.05.2025.
//

import SwiftUI

struct AdjuvantChemotherapySection: View {
    @ObservedObject var viewModel: MedCardEditViewModel
    
    var body: some View {
        Section {
            Section() {
                Picker("Статус", selection: $viewModel.medicalRecord.pathomorphology.adjuvantChemotherapy.status) {
                    Text("Не проведена").tag(ChemotherapyStatus.none)
                    Text("Проведена частично").tag(ChemotherapyStatus.partially)
                    Text("Проведена полностью").tag(ChemotherapyStatus.completed)
                }
                .pickerStyle(.wheel)
                .frame(maxHeight: 100)
            }
            
            if case .completed = viewModel.medicalRecord.pathomorphology.adjuvantChemotherapy.status {
                TextInputField("Схема", text: $viewModel.medicalRecord.pathomorphology.adjuvantChemotherapy.scheme.toUnwrapped(defaultValue: ""))
                Section(header: SectionHeader("Даты лечения")) {
                    DatePicker("Начало",
                               selection: $viewModel.medicalRecord.pathomorphology.adjuvantChemotherapy.startDate.toUnwrapped(defaultValue: Date.now),
                               displayedComponents: .date)
                    DatePicker("Окончание",
                               selection: $viewModel.medicalRecord.pathomorphology.adjuvantChemotherapy.endDate.toUnwrapped(defaultValue: Date.now),
                               in: (viewModel.medicalRecord.pathomorphology.adjuvantChemotherapy.startDate ?? Date.now)..., displayedComponents: .date)
                }
                
                
              
            }
            
            if case .partially = viewModel.medicalRecord.pathomorphology.adjuvantChemotherapy.status {
                TextInputField("Схема", text: $viewModel.medicalRecord.pathomorphology.adjuvantChemotherapy.scheme.toUnwrapped(defaultValue: ""))
                    
                    
                
                
                Section(header: SectionHeader("Даты лечения")) {
                    DatePicker("Начало", selection: $viewModel.medicalRecord.pathomorphology.adjuvantChemotherapy.startDate.toUnwrapped(defaultValue: Date.now), displayedComponents: .date)
                }
                
                Section(header: SectionHeader("Причины прерывания"))
                {
                    TextInputField("Причины прерывания", text: $viewModel.medicalRecord.pathomorphology.adjuvantChemotherapy.interruptionReasons.toUnwrapped(defaultValue: ""))
                }
            }
            
            if case .none = viewModel.medicalRecord.pathomorphology.adjuvantChemotherapy.status {
                EmptyView()
            }
            
            
        }
        .navigationTitle("Адъювантная химиотерапия")

    }

}

#Preview {
    Form { AdjuvantChemotherapySection(viewModel: MedCardEditViewModel(medicalRecord: MedicalRecord.MOCK_MedicalRecords[0], patient: Patient.MOCK_Patients[0], networkManager: FakeNetworkManager(), localManager: FakeLocalManager()))
    }
}
