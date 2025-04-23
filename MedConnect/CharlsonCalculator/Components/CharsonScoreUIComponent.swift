//
//  CharsonScoreUIComponent.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import SwiftUI

struct CharsonScoreUIComponent: View {
    let survivalLevel: Int
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                Text("10-летняя выживаемость: \(survivalLevel)%")
                    .font(.title2)
                    .bold()
                
                SurvivalLevelUIComonent(survivalLevel: survivalLevel)
            }
            .padding(.vertical, 8)
        }
    }
}
