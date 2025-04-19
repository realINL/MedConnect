//
//  PatientDiagnos.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

struct PatientDisease: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Диагноз")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Рак желудка")
                .font(.title)
                .fontWeight(.semibold)
            
            Text("Локализация")
                .font(.headline)
                .fontWeight(.semibold)
            
            Group {
                HStack {  //Локализация
                    Text("Siewert I")
                    Text("Средняя треть")
                }
                Text("5 см") // Размер
                HStack {
                    Text("Границы по ЭГДС") // Границы по ЭГДС
                    Text("Проксимальная граница") // Проксимальная граница
                    Text("Дистальная граница") // Дистальная граница
                }
                
                // Гистология
                Text("Гистология")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack {
                    Text("Железисто-плоскоклеточный")
                    Text("G1") // Дифференцировка опухоли
                    Text("Диффузный") // Тип опухоли по Lauren
                } // Гистология
                
                Text("") // Стадирование по cTNM
                Text("") // Клиническая стадия
//                Text("Осложнение основного заболевани")
            }
            .foregroundStyle(.secondary)
            .font(.callout)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .shadow(radius: 5)
        }
        .padding(.horizontal)
    }
}

#Preview {
    PatientDisease()
}
