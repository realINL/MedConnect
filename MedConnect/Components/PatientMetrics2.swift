//
//  PatientMetrics2.swift
//  MedConnect
//
//  Created by Илья Лебедев on 19.04.2025.
//

import SwiftUI

struct PatientMetrics2: View {
    let patient: Patient
    @Binding var capriniIsPresented: Bool
    @Binding var charlosIsPresented: Bool
    var body: some View {
        HStack {
            PatientCaprini(patient: patient, isPresentd: $capriniIsPresented)
            Spacer()
            PatientCharlson(patient: patient, charlosIsPresented: $charlosIsPresented)
        }
    }
}

//#Preview {
//    PatientMetrics2(patient: Patient.MOCK_Patients.first!)
//}
