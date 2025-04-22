//
//  ToggleRow.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import SwiftUI

struct ToggleRow: View {
    let title: String
    let points: Int
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            HStack {
                Text(title)
                
                Spacer()
                
                Text("+\(points)")
                    .foregroundColor(.secondary)
                    .font(.footnote)
            }
        }
        .toggleStyle(SwitchToggleStyle(tint: .accentColor))
    }
}
