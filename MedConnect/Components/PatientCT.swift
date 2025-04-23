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
            PatientDetailsCardTitle(title: "Химиотерапия", showDetails: $showDetails)
            
            if showDetails {
                VStack {
                    LabeledValueRow(value: "Проведена FLOT", label: "Статус")
                    Divider()
                    LabeledValueRow(value: "3", label: "Кол-во курсов")
                    Divider()
                    LabeledValueRow(value: "11.11.2023 - 11.12.2023", label: "Период терапии")
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
    PatientCT()
}
