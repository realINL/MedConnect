//
//  PatientMetrics.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

import SwiftUI

struct PatientMetrics: View {
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
            
            PatientMetric(metric: "ASA 3", description: "Тяжелое системное заболевание", icon: "a.circle.fill")
            Spacer()
            PatientMetric(metric: "ECOG 2", description: "Лечится амбулаторно", icon: "e.circle.fill")
            Spacer()
            PatientMetric(metric: "60 %", description: "Индекс Карновского", icon: "k.circle.fill")
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
    PatientMetrics()
}
