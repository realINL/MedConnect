//
//  PatientRT.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.04.2025.
//

import SwiftUI

struct PatientRT: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Лучевая терапия")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            HStack {
                Text("Проведена полностью")
                Spacer()
                Text("Статус")
                    .foregroundStyle(.secondary)
            }
            Divider()
            HStack {
                Text("25 гр")
                Spacer()
                Text("Суммарная очаговаря доза")
                    .foregroundStyle(.secondary)
            }
            Divider()
            HStack {
                Text("5 гр")
                Spacer()
                Text("Разовая очаговаря доза")
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
    PatientRT()
}
