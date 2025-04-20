//
//  PatientCT.swift
//  MedConnect
//
//  Created by Илья Лебедев on 19.04.2025.
//

import SwiftUI

struct PatientCT: View {
    @State var showDetails: Bool = true
    var body: some View {
        VStack(alignment: .leading) {
            HStack {Text("Химиотерапия")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    withAnimation {
                        showDetails.toggle()
                    }
                } label: {
                    Image(systemName: "chevron.\(showDetails ? "up" : "down")")
                }
            }
            .padding(.bottom)
            
            if showDetails {
                VStack {
                    HStack {
                        Text("Проведена FLOT")
                        Spacer()
                        Text("Статус")
                            .foregroundStyle(.secondary)
                    }
                    Divider()
                    HStack {
                        Text("3")
                        Spacer()
                        Text("Кол-во курсов")
                            .foregroundStyle(.secondary)
                    }
                    Divider()
                    HStack {
                        Text("11.11.2023 - 11.12.2023")
                        Spacer()
                        Text("Период терапии")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            
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
    PatientCT()
}
