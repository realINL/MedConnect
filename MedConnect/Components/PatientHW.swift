//
//  PatientHW.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

struct PatientHW: View {
    let patient: Patient
    var body: some View {
        HStack{
            Image(systemName: "figure")
                HStack() {
                    Group {
                        Text("ИМТ 25,9")
                        Text("•")
                        Text("\(patient.weight.dotOne) кг")
                        Text("•")
                        Text("\(patient.height) см")
                        if patient.weightLoss {
                            HStack {
                                Group {
                                    Image(systemName: "exclamationmark.triangle")
                                    Text("weightloss")
                                }
                                .foregroundStyle(Color.yellow)
                            }
                        }
                    }
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
                    
                    
            }
            
            Spacer()
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
    PatientHW(patient: Patient.MOCK_Patients.first!)
}

