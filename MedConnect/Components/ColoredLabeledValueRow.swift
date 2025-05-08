//
//  ColoredLabeledValueRow.swift
//  MedConnect
//
//  Created by Илья Лебедев on 13.05.2025.
//

import SwiftUI

struct ColoredLabeledValueRow: View {
    let color: Color
    let value: String
    let label: String
    
    var body: some View {
        HStack {
            Circle()
                .fill(color)
                .frame(width: 10)
            Text(value)
                .font(.body)
                .foregroundColor(.primary)
            
            Spacer()
            
            Text(label)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}


#Preview {
    ColoredLabeledValueRow(color: .blue, value: "Синий", label: "Цвет")
}
