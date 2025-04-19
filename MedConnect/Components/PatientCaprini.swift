//
//  PatientCaprini.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

import SwiftUI

struct PatientCaprini: View {
    let patient: Patient
    var body: some View {
        HStack {
            PatientMetric(metric: "\(patient.capriniIndex) балла", description: "Шкала Caprini", icon: "gauge.with.dots.needle.33percent")
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
//            PatientMetric(metric: "Выживаемость 90 %", description: "Индекс Чарльсона", icon: "gauge.with.dots.needle.100percent")
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
    PatientCaprini(patient: Patient.MOCK_Patients.first!)
}
