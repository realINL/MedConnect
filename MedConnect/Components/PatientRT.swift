//
//  PatientRT.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.04.2025.
//

import SwiftUI

struct PatientRT: View {
    @State var showDetails: Bool = true
    let radiationTherapy: RadiationTherapy = RadiationTherapy.MOCK_RadiationTherapy.first!
    var body: some View {
        VStack(alignment: .leading) {
            PatientDetailsCardTitle(title: "Лучевая терапия", showDetails: $showDetails)
            
            if showDetails {
                VStack {
                    LabeledValueRow(value: "Статус", label: radiationTherapy.status.description)
                    switch radiationTherapy.status {
                    case .none, .partially:
                        EmptyView()
                    case .completed(let sfd, let tfd):
                        Divider()
                        LabeledValueRow(value: "Суммарная очаговаря доза", label: "\(tfd)")
                        Divider()
                        LabeledValueRow(value: "Разовая очаговаря доза", label: "\(sfd)")
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
    PatientRT()
}
