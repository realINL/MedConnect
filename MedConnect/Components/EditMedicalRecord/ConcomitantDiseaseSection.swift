//
//  ConcomitantDiseaseSection.swift
//  MedConnect
//
//  Created by Илья Лебедев on 27.05.2025.
//

import SwiftUI

struct ConcomitantDiseaseSection: View {
    @ObservedObject var viewModel: MedCardEditViewModel
    var body: some View {
        // MARK: Кардио
        Section("Кардиологические заболевания") {
            // MARK: ИБС
            NavigationLink {
                FullScreenPicker(selection: $viewModel.medicalRecord.concomitantDisease.cardiacConditions.ibs,
                                 title: "ИБС",
                                 options: IschemicHeartDisease.allCases)
            } label: {
                LabeledValueRow(value: "ИБС",
                                label: viewModel.medicalRecord.concomitantDisease.cardiacConditions.ibs.rawValue)
            }
            
            // MARK: Гипертоническая болезнь
            QuickSelectPicker(title: "Гипертоническая болезнь",
                              selection: $viewModel.medicalRecord.concomitantDisease.cardiacConditions.hypertension,
                              options: Hypertension.allCases)
            
            // MARK: НПС
            NavigationLink {
                FullScreenPicker(selection: $viewModel.medicalRecord.concomitantDisease.cardiacConditions.conductionDisorders,
                                 title: "НПС",
                                 options: ConductionDisorders.allCases)
            } label: {
                LabeledValueRow(value: "НПС",
                                label: viewModel.medicalRecord.concomitantDisease.cardiacConditions.conductionDisorders.rawValue)
            }
            
            // MARK: Периферический атеросклероз
            NavigationLink {
                FullScreenPicker(selection: $viewModel.medicalRecord.concomitantDisease.cardiacConditions.peripheralAtherosclerosis,
                                 title: "Периферический атеросклероз",
                                 options: PeripheralAtherosclerosis.allCases)
            } label: {
                LabeledValueRow(value: "Периферический атеросклероз",
                                label: viewModel.medicalRecord.concomitantDisease.cardiacConditions.peripheralAtherosclerosis.rawValue)
            }
            
            // MARK: Аневризма аорты
            QuickSelectPicker(title: "Аневризма аорты",
                              selection: $viewModel.medicalRecord.concomitantDisease.cardiacConditions.aorticAneurysm,
                              options: AorticAneurysm.allCases)
            .frame(height: 60)
            
            // MARK: ХСН
            NavigationLink {
                FullScreenPicker(selection: $viewModel.medicalRecord.concomitantDisease.cardiacConditions.chf,
                                 title: "ХСН", options: HeartFailure.allCases)
            } label: {
                LabeledValueRow(value: "ХСН",
                                label: viewModel.medicalRecord.concomitantDisease.cardiacConditions.chf.rawValue)
            }
            
            // MARK: Пороки клапанов
            QuickSelectPicker(title: "Пороки клапанов",
                              selection: $viewModel.medicalRecord.concomitantDisease.cardiacConditions.valveDefects,
                              options: ValveDefects.allCases)
            
            // MARK: Кардиомиопатия
            QuickSelectPicker(title: "Кардиомиопатия",
                              selection: $viewModel.medicalRecord.concomitantDisease.cardiacConditions.cardiomyopathy,
                              options: YesNo.allCases)
        }
        
        // MARK: Легочные заболевания
        Section("Легочные заболевания") {
            QuickSelectPicker(title: "Легочные заболевания",
                              selection: $viewModel.medicalRecord.concomitantDisease.pulmonaryDiseases,
                              options: PulmonaryDiseases.allCases)
        }
        
        // MARK: Эндокринные заболевания
        
        Section("Эндокринные заболевания") {
            // MARK: Сахарный диабет
            QuickSelectPicker(title: "СД", selection: $viewModel.medicalRecord.concomitantDisease.endocrineDiseases.diabetes, options: Diabetes.allCases)
            
            // MARK: Гипотиреоз
            QuickSelectPicker(title: "Гипотиреоз", selection: $viewModel.medicalRecord.concomitantDisease.endocrineDiseases.hypothyroidism, options: YesNo.allCases)
            
            // MARK: Гиперпаратиреоз
            QuickSelectPicker(title: "Гиперпаратиреоз", selection: $viewModel.medicalRecord.concomitantDisease.endocrineDiseases.hyperparathyroidism, options: YesNo.allCases)
            
        }
        
        // MARK: Хроническая болезнь почек
        Section("Хроническая болезнь почек") {
            QuickSelectPicker(title: "ХБП", selection: $viewModel.medicalRecord.concomitantDisease.сhronicKidneyDisease, options: YesNo.allCases)
            
        }
        
        // MARK:
    }
}

#Preview {
    Form {ConcomitantDiseaseSection(viewModel:MedCardEditViewModel(medicalRecord: MedicalRecord.MOCK_MedicalRecords[0], patient: Patient.MOCK_Patients[0], networkManager: FakeNetworkManager(), localManager: FakeLocalManager())) }
}
