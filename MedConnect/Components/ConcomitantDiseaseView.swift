//
//  ConcomitantDisease.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.04.2025.
//

import SwiftUI

struct ConcomitantDiseaseView: View {
    let cardiacConditions: CardiacConditions = CardiacConditions.MOCK_CardiacConditions
    var body: some View {
        VStack(alignment: .leading) {
            Text("Кардиологические заболевания")
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            LabeledValueRow(value: cardiacConditions.ibs.rawValue, label: "ИБС")
            Divider()
            LabeledValueRow(value: cardiacConditions.hypertension.rawValue, label: "Гипертоническая болезнь")
            Divider()
            LabeledValueRow(value: cardiacConditions.conductionDisorders.rawValue, label: "НПС")
            Divider()
            LabeledValueRow(value: cardiacConditions.peripheralAtherosclerosis.rawValue, label: "Периферический атеросклероз")
            Divider()
            LabeledValueRow(value: cardiacConditions.aorticAneurysm.rawValue, label: "Аневризма аорты")
            Divider()
            LabeledValueRow(value: cardiacConditions.chf.rawValue, label: "ХСН")
            Divider()
            LabeledValueRow(value: cardiacConditions.valveDefects.rawValue, label: "Пороки клапанов")
            Divider()
            LabeledValueRow(value: cardiacConditions.cardiomyopathy.description, label: "Кардиомиопатия")
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.background)
                .shadow(radius: 5)
        }
        .padding(.horizontal)
        .padding(.top)
    }
    
}

#Preview {
    ConcomitantDiseaseView()
}
