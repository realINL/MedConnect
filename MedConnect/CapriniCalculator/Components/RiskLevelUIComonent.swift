//
//  RiskLevelUIComonent.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import SwiftUI

struct RiskLevelUIComonent: View {
    let score: Int
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(0..<4) { level in
                Capsule()
                    .fill(levelColor(for: score, current: level))
                    .frame(height: 8)
            }
        }
        //        .overlay(
        //            Text(riskDescription(for: score))
        //                .font(.caption)
        //                .padding(4)
        //                .background(Color(.systemBackground))
        //                .cornerRadius(4)
        //                .offset(y: 20),
        //            alignment: .bottom
        //        )
    }
    
    private func levelColor(for score: Int, current: Int) -> Color {
        let activeLevel = riskLevel(for: score)
        return activeLevel >= current ? colorForLevel(activeLevel) : Color(.systemGray5)
    }
    
    private func riskLevel(for score: Int) -> Int {
        switch score {
        case 0...1: return 0
        case 2: return 1
        case 3...4: return 2
        default: return 3
        }
    }
    
    private func colorForLevel(_ level: Int) -> Color {
        switch level {
        case 0: return .green
        case 1: return .yellow
        case 2: return .orange
        default: return .red
        }
    }
    
    private func riskDescription(for score: Int) -> String {
        switch score {
        case 0...1: return "Очень низкий"
        case 2: return "Низкий"
        case 3...4: return "Средний"
        default: return "Высокий"
        }
    }
    
}
