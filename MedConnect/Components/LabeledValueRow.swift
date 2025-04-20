//
//  LabeledValueRow.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.04.2025.
//

import SwiftUI

struct LabeledValueRow: View {
    let value: String
    let label: String
    
    var body: some View {
        HStack {
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
    LabeledValueRow(value: "Tesla", label: "Марка")
}
