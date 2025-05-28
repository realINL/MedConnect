//
//  PatientCharlson.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

struct PatientCharlson: View {
    let medicalRecord: MedicalRecord
    @Binding var charlosIsPresented: Bool
    var body: some View {
        HStack {
            PatientMetric(metric: "\(medicalRecord.chrlsonIndex) % ", description: "Индекс Чарльсона", icon: "gauge.with.dots.needle.100percent", iconColor: .green)
//                .padding(.trailing)
            Spacer()
            Button {
                charlosIsPresented.toggle()
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
                .fill(.background)
                .shadow(radius: 5)
        }
        .padding(.trailing)
        .popover(isPresented: $charlosIsPresented) {
            CharlsonCalculatorView(viewModel: CharlsonCalculatorViewModel(medicalRecord: medicalRecord))
        }
    }
    
}

#Preview {
    PatientCharlson(medicalRecord: MedicalRecord.MOCK_MedicalRecords.first!, charlosIsPresented: .constant(false))
}
