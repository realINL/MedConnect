//
//  SurgeryView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 12.05.2025.
//

import SwiftUI

struct SurgeryView: View {
    let surgery: Surgery
    var body: some View {
        ScrollView {
            VStack {
                if let patient = surgery.patient {
                    PatienHeaderInfo(patient: patient)
                }
                SurgeryDetails(surgery: surgery)
            }
        }
        .navigationTitle("Операция")
    }
}

#Preview {
    SurgeryView(surgery: Surgery.MOCK_Surgery)
}
