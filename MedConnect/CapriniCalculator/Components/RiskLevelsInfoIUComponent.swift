//
//  RiskLevelIUComponent.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import SwiftUI

struct RiskLevelsInfoIUComponent: View {
    var body: some View {
        Section(header: Text("Уровни риска").font(.headline)) {
            InfoRowUIComponent(title: "0-1 балл", description: "Очень низкий", color: .green)
            InfoRowUIComponent(title: "2 балла", description: "Низкий", color: .yellow)
            InfoRowUIComponent(title: "3-4 балла", description: "Средний", color: .orange)
            InfoRowUIComponent(title: "≥ 5 баллов", description: "Высокий", color: .red)
        }
    }
}

#Preview {
    RiskLevelsInfoIUComponent()
}
