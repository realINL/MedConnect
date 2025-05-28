//
//  Text+Extension.swift
//  MedConnect
//
//  Created by Илья Лебедев on 08.05.2025.
//

import SwiftUI

extension Text {
    func secondaryTitleStyle() -> some View {
        self
            .font(.title3)
            .foregroundStyle(.secondary)
            .padding(.top, 4)
    }
    func thirdlyTitleStyle() -> some View {
        self
            .font(.headline)
            .foregroundStyle(.secondary)
            .padding(.top, 2)
    }
}

extension View {
    func cardView() -> some View {
        self
            .frame(maxWidth: .infinity)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.background)
                    .shadow(radius: 5)
            }
            .padding(.horizontal)
    }
    
}
