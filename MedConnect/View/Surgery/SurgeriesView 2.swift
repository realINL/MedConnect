//
//  SurgeriesView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 11.05.2025.
//

import SwiftUI

struct SurgeriesView: View {
    let surgeries: [Surgery]?
    var body: some View {
        if let surgeries = surgeries {
            ForEach(surgeries, id: \.id) { surgery in
                SurgeryDetails(surgery: surgery)
            }
        }
    }
}

#Preview {
    SurgeriesView(surgeries: nil)
}
