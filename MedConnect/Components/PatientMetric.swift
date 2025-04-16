//
//  PatientMetric.swift
//  MedConnect
//
//  Created by Илья Лебедев on 16.04.2025.
//

import SwiftUI

struct PatientMetric: View {
    let metric: String
    let description: String
    let icon: String
    var iconColor: Color = .yellow
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: icon)
                    .foregroundStyle(iconColor)
                Text(metric)
            }
            .font(.headline)
            .fontWeight(.bold)
            Text(description)
            
                .font(.caption)
                .foregroundStyle(Color.secondary)
        }
        
        
    }
}

#Preview {
    PatientMetric(metric: "ASA 3", description: "Тяжелое системное заболевание", icon: "a.circle.fill")
}
