//
//  PatientCharlson.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

struct PatientCharlson: View {
    let v = 50.0
    var body: some View {
        HStack {
            PatientMetric(metric: "90 % ", description: "Индекс Чарльсона", icon: "gauge.with.dots.needle.100percent", iconColor: .green)
            Spacer()
            Button {
                
            } label: {
                 Text("Рассчитать")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .padding(10)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
        }
        .frame(maxWidth: .infinity)
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
    PatientCharlson()
}
