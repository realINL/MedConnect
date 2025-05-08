//
//  CardView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 09.05.2025.
//

import SwiftUI

struct CardView<Content: View>: View {
    let title: String
    @Binding var showDetails: Bool
    @ViewBuilder let content: () -> Content
    var body: some View {
        VStack(alignment: .leading) {
            PatientDetailsCardTitle(title: title, showDetails: $showDetails)
            if showDetails {
                content()
            }
        }
            .cardView()
    }
}

#Preview {
    CardView(title: NSLocalizedString("HospitalComplications", comment: "Hospital сomplications"),
             showDetails: .constant(true)) {
        Text("Hi")
    }
}
