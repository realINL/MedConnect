//
//  PatientRT.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.04.2025.
//

import SwiftUI

struct PatientRT: View {
    @State var showDetails: Bool = true
    var body: some View {
        VStack(alignment: .leading) {
            PatientDetailsCardTitle(title: "Лучевая терапия", showDetails: $showDetails)
            
            if showDetails {
                VStack {
                    LabeledValueRow(value: "Статус", label: "Проведена полностью")
                    Divider()
                    LabeledValueRow(value: "Суммарная очаговаря доза", label: "25 гр")
                    Divider()
                    LabeledValueRow(value: "Разовая очаговаря доза", label: "5 гр")
//                    HStack {
//                        Text("Проведена полностью")
//                        Spacer()
//                        Text("Статус")
//                            .foregroundStyle(.secondary)
//                    }
//                    Divider()
//                    HStack {
//                        Text("25 гр")
//                        Spacer()
//                        Text("Суммарная очаговаря доза")
//                            .foregroundStyle(.secondary)
//                    }
//                    Divider()
//                    HStack {
//                        Text("5 гр")
//                        Spacer()
//                        Text("Разовая очаговаря доза")
//                            .foregroundStyle(.secondary)
//                    }
//                    Divider()
//                    HStack {
//                        Text("11.11.2023 - 11.12.2023")
//                        Spacer()
//                        Text("Период терапии")
//                            .foregroundStyle(.secondary)
//                    }
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
    }
}

#Preview {
    PatientRT()
}
