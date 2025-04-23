//
//  PatientCT.swift
//  MedConnect
//
//  Created by Илья Лебедев on 19.04.2025.
//

import SwiftUI

struct PatientCT: View {
    @State var showDetails: Bool = true
    let chemo: Chemotherapy = Chemotherapy.MOCK_Chemotherapy.first!
    var body: some View {
        VStack(alignment: .leading) {
            PatientDetailsCardTitle(title: "Химиотерапия", showDetails: $showDetails)
            
            if showDetails {
                VStack {
                    LabeledValueRow(value: chemo.staus.description, label: "Статус")
                    switch chemo.staus {
                    case .none:
                        EmptyView()
                    case .partially:
                        Divider()
                        LabeledValueRow(value: "\(chemo.startDate.date)", label: "Начало терапии")
                    case .completed(let scheme, let endDate):
                        Divider()
                        LabeledValueRow(value: "\(chemo.numberOfCourses)", label: "Кол-во курсов")
                        Divider()
                        LabeledValueRow(value: "\(chemo.startDate.date) - \(chemo.endDate.date)", label: "Период терапии")
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
    }
}

#Preview {
    PatientCT()
}
