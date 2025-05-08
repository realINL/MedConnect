//
//  PatientCaprini.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

import SwiftUI

struct PatientCaprini: View {
    let medicalRecord: MedicalRecord
    @Binding var isPresentd: Bool
    var body: some View {
        HStack {
            PatientMetric(metric: "\(medicalRecord.capriniIndex) балла", description: "Шкала Caprini", icon: "gauge.with.dots.needle.33percent")
//                .padding(.trailing)
            
            Spacer()

            Button {
                isPresentd.toggle()
            } label: {
//                 Text("Рассчитать")
                Image(systemName: "plus.forwardslash.minus")
                    .font(.title)
                    .foregroundStyle(Color(.systemGray4))
                    .fontWeight(.bold)
//                    .padding(10)
//                    .background(Color(.systemBlue))
//                    .cornerRadius(10)
            }
//            PatientMetric(metric: "Выживаемость 90 %", description: "Индекс Чарльсона", icon: "gauge.with.dots.needle.100percent")
        }
//        .frame(maxWidth: .infinity)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.background)
                .shadow(radius: 5)
        }
        .padding(.leading)
        .popover(isPresented: $isPresentd) {
            CapriniCalculatorView(viewModel: CapriniCalculatorViewModel(medicalRecord: medicalRecord))
        }
    }
}

#Preview {
    PatientCaprini(medicalRecord: MedicalRecord.MOCK_MedicalRecords.first!, isPresentd: .constant(false))
}
