//
//  CharlsonRiskFactorsUIComponent.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import SwiftUI

struct CharlsonRiskFactorsUIComponent: View {
    let binding: (Int) -> Binding<Bool>
    
    var body: some View {
        Section(header: Text("Болезни").font(.headline)) {
            ForEach(CharsonRiskFactor.charlsonRiksFactors, id: \.id) { riskFactor in
                ToggleRow(title: riskFactor.title, points: riskFactor.poinrs, isOn: binding(riskFactor.id))
            }
        }
    }
}
