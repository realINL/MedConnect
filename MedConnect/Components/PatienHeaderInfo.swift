//
//  PatienHeaderInfo.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

struct PatienHeaderInfo: View {
    let patient: Patient
    var body: some View {
        HStack{
            Image("patient")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .cornerRadius(5)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(patient.surname) \(patient.name.firstLetter). \(patient.patronymic.firstLetter).")
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack() {
                    Group {
                        Text(patient.sex.rawValue.firstLetter)
                        Text("•")
                        Text(patient.age.ageCount)
                    }
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
                }
                
                HStack() {
                    Group {
                        Text(patient.hospital)
                        Text("•")
                        Text(patient.hospitalDepartment)
                    }
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
                    
                }
                
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
    }
}

#Preview {
    PatienHeaderInfo(patient: Patient.MOCK_Patients.first!)
}
