//
//  PatienHeaderInfo.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

struct PatienHeaderInfo: View {
    var body: some View {
        HStack{
            Image("patient")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 100)
                .cornerRadius(5)
            VStack(alignment: .leading, spacing: 8) {
                Text("Иванов И. И.")
                    .font(.title)
                    .fontWeight(.bold)
                HStack() {
                    Group {
                        Text("52 года")
                        Text("•")
                        Text("М")
                    }
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
                }
                HStack() {
                    Group {
                        Text("МНИОИ им. П.А. Герцена")
                        Text("•")
                        Text("Торакальное отделение")
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
                .fill(.white)
                .shadow(radius: 5)
        }
        .padding(.horizontal)
    }
}

#Preview {
    PatienHeaderInfo()
}
