//
//  ConcomitantDisease.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.04.2025.
//

import SwiftUI

struct ConcomitantDiseaseView: View {
    let concomitantDisease: ConcomitantDisease = ConcomitantDisease.MOCK_ConcomitantDisease
    @State var showDetails: Bool = true
    var body: some View {
        VStack(alignment: .leading) {
            PatientDetailsCardTitle(title: "Сопутсвующие заболевания", showDetails: $showDetails)
            
            if showDetails {
                VStack(alignment: .leading) {
                    Text("Кардиологические заболевания")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    LabeledValueRow(value: concomitantDisease.cardiacConditions.ibs.rawValue, label: "ИБС")
                    Divider()
                    LabeledValueRow(value: concomitantDisease.cardiacConditions.hypertension.rawValue, label: "Гипертоническая болезнь")
                    Divider()
                    LabeledValueRow(value: concomitantDisease.cardiacConditions.conductionDisorders.rawValue, label: "НПС")
                    Divider()
                    LabeledValueRow(value: concomitantDisease.cardiacConditions.peripheralAtherosclerosis.rawValue, label: "Периферический атеросклероз")
                    Divider()
                    LabeledValueRow(value: concomitantDisease.cardiacConditions.aorticAneurysm.rawValue, label: "Аневризма аорты")
                    Divider()
                    LabeledValueRow(value: concomitantDisease.cardiacConditions.chf.rawValue, label: "ХСН")
                    Divider()
                    LabeledValueRow(value: concomitantDisease.cardiacConditions.valveDefects.rawValue, label: "Пороки клапанов")
                    Divider()
                    LabeledValueRow(value: concomitantDisease.cardiacConditions.cardiomyopathy.rawValue, label: "Кардиомиопатия")
                    Divider()
                    
                    Text("Легочные заболевания")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                    LabeledValueRow(value: concomitantDisease.pulmonaryDiseases.rawValue, label: "Легочные заболевания")
                    
                    Text("Эндокринные заболевания")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                    LabeledValueRow(value: concomitantDisease.endocrineDiseases.diabetes.rawValue, label: "СД")
                    Divider()
                    LabeledValueRow(value: concomitantDisease.endocrineDiseases.hypothyroidism.rawValue, label: "Гипотиреоз")
                    Divider()
                    LabeledValueRow(value: concomitantDisease.endocrineDiseases.hyperparathyroidism.rawValue, label: "Гиперпаратиреоз")
                    
                    Text("Заболевания почек")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                    LabeledValueRow(value: concomitantDisease.сhronicKidneyDisease.rawValue, label: "Хроническая болезнь почек")
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.background)
                .shadow(radius: 5)
        }
        .padding(.horizontal)
    }
    
}

#Preview {
    ConcomitantDiseaseView()
}
