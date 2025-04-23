//
//  PatientMetrics.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

import SwiftUI

struct PatientMetrics: View {
    let medicalRecord: MedicalRecord
    var body: some View {
        HStack{
//            VStack {
//                HStack {
//                    Group {
//                        Image(systemName: "a.circle.fill")
//                            .foregroundStyle(.yellow)
//                        Text("ASA 3")
//
//                        Spacer()
//
//                        Image(systemName: "e.circle.fill")
//                            .foregroundStyle(.yellow)
//                        Text("ECOG 2")
//
//                        Spacer()
//
//                        Image(systemName: "k.circle.fill")
//                            .foregroundStyle(.yellow)
//                        Text("60 %")
//
////                        Spacer()
////
////                        Image(systemName: "plus.forwardslash.minus")
////                            .foregroundStyle(.yellow)
////                        Text("Потеря веса")
////
//                    }
//                        .font(.headline)
//                        .fontWeight(.bold)
//                }
//
//                HStack {
//                    Group {
//                        Text("Тяжелое системное заболевание")
//
//                        Spacer()
//
//
//                        Text("Лечится амбулаторно")
//
//                        Spacer()
//
//
//                        Text("Индекс Карновского")
//
//                    }
//                    .font(.caption)
//                    .foregroundStyle(Color.secondary)
//                }
//            }
            
            PatientMetric(metric: "ASA \(medicalRecord.asaIndex)", description:
                                "", //                            "Тяжелое системное заболевание",
                          icon: "a.circle.fill")
            Spacer()
            PatientMetric(metric: "ECOG \(medicalRecord.ecogIndex)", description:
                            "", // "Лечится амбулаторно",
                          icon: "e.circle.fill")
            Spacer()
            PatientMetric(metric: "\(medicalRecord.karnofskyIndex) %", description:
                            "", // "Индекс Карновского",
                          icon: "k.circle.fill")
        }
        .frame(maxWidth: .infinity)
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
    PatientMetrics(medicalRecord: MedicalRecord.MOCK_MedicalRecord.first!)
}
