//
//  TotalScoreUIComponent.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import SwiftUI

struct TotalScoreUIComponent: View {
    let totalScore: Int
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                Text("Общий балл: \(totalScore)")
                    .font(.title2)
                    .bold()
                
                RiskLevelUIComonent(score: totalScore)
            }
            .padding(.vertical, 8)
        }
    }
}
