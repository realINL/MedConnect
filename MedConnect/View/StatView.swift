//
//  StatView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 13.05.2025.
//

import SwiftUI

struct StatView: View {
    let quantity: Int = 2
    let stomachQ: Int = 1
    let esophagusQ: Int = 1
    
    let mfQ: Int = 3
    let male: Int = 3
    let female: Int = 0
    
    let localization: Int = 100
    
    let kerQ: Int = 3
    let ker1: Int = 1
    let ker2: Int = 1
    let ker3: Int = 1
    
    var body: some View {
        GeometryReader { geometry in
            List {
                Section("Статистика по нозологиям"){
                    LabeledValueRow(value: quantity.description, label: "Общее количество")
                    
                    ColoredLabeledValueRow(color: .brown,
                                           value: getPercentage(stomachQ, quantity),
                                           label: "Рак желудка")
                  
                    ColoredLabeledValueRow(color: .teal,
                                           value: getPercentage(esophagusQ, quantity),
                                           label: "Рак пищевода")
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: .brown, location: 0),
                                            Gradient.Stop(color: .brown, location: 0.5),
                                            Gradient.Stop(color: .teal, location: 0.5),
                                            Gradient.Stop(color: .teal, location: 1)
                                        ],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                            .frame(height: 20)
                            .cornerRadius(10)
                        
                       
                    }
                }
                
                Section("Общая статистика") {
                    LabeledValueRow(value: mfQ.description, label: "Общее количество")
                    ColoredLabeledValueRow(color: .teal, value: getPercentage(male, mfQ), label: "Мужчины")
                    ColoredLabeledValueRow(color: .pink, value: getPercentage(female, mfQ), label: "Женщины")
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: .teal, location: 0),
                                            Gradient.Stop(color: .teal, location: 1),
                                            Gradient.Stop(color: .pink, location: 1),
                                            Gradient.Stop(color: .pink, location: 1)
                                        ],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                            .frame(height: 20)
                            .cornerRadius(10)
                        
                       
                    }
                }
                
                Section("Локализация") {
                    ColoredLabeledValueRow(color: .teal, value: "100%", label: "КЭР")
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: .teal, location: 0),
                                            Gradient.Stop(color: .teal, location: 1),
                                            Gradient.Stop(color: .pink, location: 1),
                                            Gradient.Stop(color: .pink, location: 1)
                                        ],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                            .frame(height: 20)
                            .cornerRadius(10)
                        
                       
                    }
                }
                
                Section("КЭР") {
                    LabeledValueRow(value: kerQ.description, label: "Общее количество")
                    ColoredLabeledValueRow(color: .teal, value: getPercentage(ker1, kerQ), label: "Siewert I")
                    ColoredLabeledValueRow(color: .indigo, value: getPercentage(ker2, kerQ), label: "Siewert II")
                    ColoredLabeledValueRow(color: .pink, value: getPercentage(ker3, kerQ), label: "Siewert III")
                    HStack(spacing: 0) {
                        Rectangle()
                            .fill(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: .teal, location: 0),
                                            Gradient.Stop(color: .teal, location: getPercentageToOne(ker1, kerQ)),
                                            Gradient.Stop(color: .indigo, location: getPercentageToOne(ker1, kerQ)),
                                            Gradient.Stop(color: .indigo, location:  getPercentageToOne(ker1, kerQ) + getPercentageToOne(ker2, kerQ)),
                                            Gradient.Stop(color: .pink, location: getPercentageToOne(ker1, kerQ) + getPercentageToOne(ker2, kerQ)),
                                            Gradient.Stop(color: .pink, location: 1)
                                        ],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                            .frame(height: 20)
                            .cornerRadius(10)
                        
                       
                    }
                }
            }
            .navigationTitle("Статистика")
        }
    }
    
    
    func getPercentage(_ fraction: Int, _ total: Int) -> String {
        let fraction: Double = fraction.toDouble()
        let total: Double = total.toDouble()
        
        let result = fraction / total * 100.0
        
        let resultString = "\(Int(result))%"
        
        return resultString
    }
    
    func getPercentageToOne(_ fraction: Int, _ total: Int) -> Double {
        let fraction: Double = fraction.toDouble()
        let total: Double = total.toDouble()
        
        let result = fraction / total
        
        return result
    }
}

#Preview {
    StatView()
}
