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
            HStack {
                Text("Рак пищевода")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text("Диагноз")
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
            .padding(.top, 4)
            
            //Локализация
            Text("Локализация")
                .font(.title3)
                .foregroundStyle(.secondary)
            
            HStack {
                Text("Средняя треть")
                Text("Siewert I")
            }
            Text("5 x 5 см") // Размер
            
            
            // Гистология
            Text("Гистология")
                .font(.title3)
                .foregroundStyle(.secondary)
                .padding(.top, 4)
            Text("Железисто-плоскоклеточный")
            
            HStack {
                Text("Диффузный") // Тип опухоли по Lauren
                Text("G1") // Дифференцировка опухоли
            } // Гистология
            
            HStack {
                Text("T1N0M0") // Стадирование по cTNM
                Text("Клиническая стадия I")
            }
            .padding(.top, 4)
            
            Text("") // Клиническая стадия
            //                Text("Осложнение основного заболевани")
            //            }
            //            .foregroundStyle(.secondary)
            //            .font(.callout)
            Text("Границы по ЭГДС") // Границы по ЭГДС
                .font(.title3)
                .foregroundStyle(.secondary)
            
            VStack(alignment: .leading) {
                Text("Проксимальная граница") // Проксимальная граница
                Text("Дистальная граница") // Дистальная граница
            }
            
            Text("Осложнение") // Осложнение
                .font(.title3)
                .foregroundStyle(.secondary)
                .padding(.top, 4)
            Text("Стеноз без стентирования")
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
