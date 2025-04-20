//
//  PatientDetailsCardTitle.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.04.2025.
//

import SwiftUI

struct PatientDetailsCardTitle: View {
    let title: String
    @Binding var showDetails: Bool
    var body: some View {
        HStack {Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            
           
            
            Button {
                withAnimation {
                    showDetails.toggle()
                }
            } label: {
                Spacer()
                Image(systemName: "chevron.\(showDetails ? "up" : "down")")
            }
        }
        .padding(.bottom, showDetails ? 16 : 0)
    }
}

#Preview {
    PatientDetailsCardTitle(title: "Диагноз", showDetails: .constant(false))
}
