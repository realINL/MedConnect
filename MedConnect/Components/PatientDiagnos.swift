//
//  PatientDiagnos.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

struct PatientDiagnos: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Диагноз")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Рак желудка")
                .font(.title)
                .fontWeight(.semibold)
            
            Group {
                Text("Аденокарцинома")
                Text("G3")
                Text("Диффузный")
                Text("Siewert I" + " " + "Проксимальная третья")
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
    PatientDiagnos()
}
