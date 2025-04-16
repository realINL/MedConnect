//
//  PatientHW.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

struct PatientHW: View {
    var body: some View {
        HStack{
            Image(systemName: "figure")
                HStack() {
                    Group {
                        Text("ИМТ 25,9")
                        Text("•")
                        Text("82 кг")
                        Text("•")
                        Text("178 см")
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
    PatientHW()
}

