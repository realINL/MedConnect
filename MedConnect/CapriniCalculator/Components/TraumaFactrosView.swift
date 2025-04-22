//
//  TraumaFactrosView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import SwiftUI

struct TraumaFactrosView: View {
    let binding: (Int) -> Binding<Bool>
    
    var body: some View {
        Section(header: Text("Факторы риска, связанные с травмой или с оперативным вмешательством:").font(.headline)) {
            ForEach(RiskFactor.traumaRiskFactors, id: \.id) { riskFacor in
                ToggleRow(title: riskFacor.title, points: riskFacor.points, isOn: binding(riskFacor.id))
            }
        }
    }
}
