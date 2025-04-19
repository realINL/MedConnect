//
//  PatientCardView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.01.2025.
//

import SwiftUI

struct PatientCardView: View {
        let patient: Patient
    var body: some View {
        VStack(spacing: 10) {
            PatienHeaderInfo(patient: patient)
            PatientHW(patient: patient)
            PatientMetrics(patient: patient)
            PatientCaprini(patient: patient)
            PatientCharlson(patient: patient)
            PatientDisease()
            Text("Сопутсвующие заболевания")
            Spacer()
        }
    }
}

#Preview {
    PatientCardView(patient: Patient.MOCK_Patients.first!)
}
