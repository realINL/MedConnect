//
//  PatientCharlson.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

struct PatientCharlson: View {
    let patient: Patient
    var body: some View {
        HStack {
            PatientMetric(metric: "\(patient.chrlsonIndex) % ", description: "Индекс Чарльсона", icon: "gauge.with.dots.needle.100percent", iconColor: .green)
//                .padding(.trailing)
//            Spacer()
            Button {
                
            } label: {
//                 Text("Рассчитать")
                Image(systemName: "plus.forwardslash.minus")
                    .font(.title)
                    .foregroundStyle(Color(.systemGray4))
                    .fontWeight(.semibold)
//                    .padding(10)
//                    .background(Color(.systemBlue))
//                    .cornerRadius(10)
            }
        }
//        .frame(maxWidth: .infinity)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .shadow(radius: 5)
        }
        .padding(.trailing)
    }
}

#Preview {
    PatientCharlson(patient: Patient.MOCK_Patients.first!)
}
