//
//  ListButtonCentredTextUIComponent.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import SwiftUI

struct ListButtonCentredTextUIComponent: View {
    let text: String
    let textColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity, alignment: .center)
        }
    }
}
