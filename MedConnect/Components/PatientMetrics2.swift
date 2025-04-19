//
//  PatientMetrics2.swift
//  MedConnect
//
//  Created by Илья Лебедев on 19.04.2025.
//

import SwiftUI

struct PatientMetrics2: View {
    let patient: Patient
    var body: some View {
        HStack {
            PatientCaprini(patient: patient)
            Spacer()
            PatientCharlson(patient: patient)
        }
    }
}

#Preview {
    PatientMetrics2(patient: Patient.MOCK_Patients.first!)
}
