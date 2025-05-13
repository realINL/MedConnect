//
//  RadiationTherapySection.swift
//  MedConnect
//
//  Created by Илья Лебедев on 27.05.2025.
//

import SwiftUI

struct RadiationTherapySection: View {
    @ObservedObject var viewModel: MedCardEditViewModel
    var body: some View {
        Section {
            Section() {
                Picker("Статус", selection: $viewModel.medicalRecord.radiationTherapy.status) {
                    Text("Не проведена").tag(RadiationTherapyStatus.none)
                    Text("Проведена частично").tag(RadiationTherapyStatus.partially)
                    Text("Проведена полностью").tag(RadiationTherapyStatus.completed)
                }
                .pickerStyle(.wheel)
                .frame(maxHeight: 100)
            }
            
            if case .completed = viewModel.medicalRecord.radiationTherapy.status {
                
                Section(header: SectionHeader("Даты терапии")) {
                    DatePicker("Начало", selection: $viewModel.medicalRecord.radiationTherapy.startDate, displayedComponents: .date)
                    DatePicker("Окончание", selection: $viewModel.medicalRecord.radiationTherapy.endDate, in: viewModel.medicalRecord.radiationTherapy.startDate..., displayedComponents: .date)
                }
                
                Section(header: SectionHeader("Доза")) {
                   
                    
                    DoubleTextField(value: $viewModel.medicalRecord.radiationTherapy.sfd.toUnwrapped(defaultValue: 0),
                                    title: "Разовая очаговая доза",
                                    suffix: ""
                    )
                    
                    DoubleTextField(value: $viewModel.medicalRecord.radiationTherapy.tfd.toUnwrapped(defaultValue: 0),
                                    title: "Суммарная очаговая доза",
                                    suffix: ""
                    )
                    
                    
                           
                        
                    
                }
            }
            
            if case .partially = viewModel.medicalRecord.radiationTherapy.status {
                Section(header: SectionHeader("Даты лечения")) {
                    DatePicker("Начало", selection: $viewModel.medicalRecord.radiationTherapy.startDate, displayedComponents: .date)
                }
                
                Section(header: SectionHeader("Доза")) {
                   
                    
                    DoubleTextField(value: $viewModel.medicalRecord.radiationTherapy.sfd.toUnwrapped(defaultValue: 0),
                                    title: "Разовая очаговая доза",
                                    suffix: ""
                    )
                    
                    DoubleTextField(value: $viewModel.medicalRecord.radiationTherapy.tfd.toUnwrapped(defaultValue: 0),
                                    title: "Суммарная очаговая доза",
                                    suffix: ""
                    )
                    
                    
                           
                        
                    
                }
            }
            
            if case .none = viewModel.medicalRecord.radiationTherapy.status {
                EmptyView()
            }
        } 
        .navigationTitle("Лучевая терапия")

    }
}

#Preview {
    RadiationTherapySection(viewModel: MedCardEditViewModel(medicalRecord: MedicalRecord.MOCK_MedicalRecords[0], patient: Patient.MOCK_Patients[0], networkManager: FakeNetworkManager(), localManager: FakeLocalManager()))
}
