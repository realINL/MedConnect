//
//  SurvivalLevel.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import SwiftUI

struct SurvivalLevelUIComonent: View {
    let survivalLevel: Int
    
    var body: some View {
        HStack(spacing: 12) {
            ForEach(0..<4) { level in
                Capsule()
                    .fill(levelColor(for: survivalLevel, current: level))
                    .frame(height: 8)
            }
        }
    }
    
    private func levelColor(for score: Int, current: Int) -> Color {
        let activeLevel = survivalLevel(for: score)
        return activeLevel >= current ? colorForLevel(activeLevel) : Color(.systemGray5)
    }
    
    private func survivalLevel(for score: Int) -> Int {
        switch score {
        case 99: return 0
        case 96: return 0
        case 90: return 1
        case 77: return 1
        case 53: return 2
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
}

