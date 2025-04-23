//
//  PatientHW.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

struct PatientHW: View {
    let medicalRecord: MedicalRecord
    var body: some View {
        HStack{
            Image(systemName: "figure")
                HStack() {
                    Group {
                        Text("ИМТ 25,9")
                        Text("•")
                        Text("\(medicalRecord.weight.dotOne) кг")
                        Text("•")
                        Text("\(medicalRecord.height) см")
                        if medicalRecord.weightLoss {
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
                .fill(.background)
                .shadow(radius: 5)
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

#Preview {
    PatientHW(medicalRecord: MedicalRecord.MOCK_MedicalRecord.first!)
}

