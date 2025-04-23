//
//  PatientDiagnos.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

struct PatientDisease: View {
    let medicalRecord: MedicalRecord
    let disease: StomachCancer
    
    init(medicalRecord: MedicalRecord) {
        self.medicalRecord = medicalRecord
        self.disease = medicalRecord.disease
    }
    var body: some View {
        VStack(alignment: .leading) {
            
            // Основная информация
            HStack {
                Text(disease.type.rawValue)
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text("Диагноз")
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
            .padding(.top, 4)
            
            // Локализация
            Text("Локализация")
                .font(.title3)
                .foregroundStyle(.secondary)
            
            HStack {
                Text(disease.tumorLocalization.tumorBody.rawValue)  // Тело
                Text(disease.tumorLocalization.siewert.shortCode)   // Кэр
            }
            Text("\(disease.size) см")  // Размер
            
            
            // Гистология
            Text("Гистология")
                .font(.title3)
                .foregroundStyle(.secondary)
                .padding(.top, 4)
            
            Text(disease.histology.rawValue)    // Гистология
            
            HStack {
                Text(disease.lauren.rawValue)   // Тип опухоли по Lauren
                Text(disease.tumorDifferentiation.shortCode)    // Дифференцировка опухоли
            }
            
            HStack {
                Text(disease.cTNM.ctnm) // Стадирование по cTNM
                Text("Клиническая стадия \(disease.cTNM.stage)")
            }
            .padding(.top, 4)
                           
            // Границы по ЭГДС
            Text("Границы по ЭГДС")
                .font(.title3)
                .foregroundStyle(.secondary)
                .padding(.top, 4)
            
            VStack(alignment: .leading) {
                Text("Проксимальная граница")   // Проксимальная граница
                Text("Дистальная граница")      // Дистальная граница
            }
            
            // Осложнение
            Text("Осложнение")
                .font(.title3)
                .foregroundStyle(.secondary)
                .padding(.top, 4)
            
            Text(disease.mainDiseaseConcomitant.rawValue)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
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
    PatientDisease(medicalRecord: MedicalRecord.MOCK_MedicalRecord.first!)
}
