//
//  OrganismStateFactorsView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import SwiftUI

struct OrganismStateFactorsView: View {
    let binding: (Int) -> Binding<Bool>
    
    var body: some View {
        Section(header: Text("Факторы, связанные с состоянием организма человека").font(.headline)) {
            ForEach(RiskFactor.organismStateRiskFactors, id: \.id) { riskFactor in
                ToggleRow(title: riskFactor.title, points: riskFactor.points, isOn: binding(riskFactor.id))
            }
        }
    }
}
