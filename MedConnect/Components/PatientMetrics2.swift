//
//  PatientMetrics2.swift
//  MedConnect
//
//  Created by Илья Лебедев on 19.04.2025.
//

import SwiftUI

struct PatientMetrics2: View {
    let medicalRecord: MedicalRecord
    @Binding var capriniIsPresented: Bool
    @Binding var charlosIsPresented: Bool
    var body: some View {
        HStack {
            PatientCaprini(medicalRecord: medicalRecord, isPresentd: $capriniIsPresented)
            Spacer()
            PatientCharlson(medicalRecord: medicalRecord, charlosIsPresented: $charlosIsPresented)
        }
    }
}

//#Preview {
//    PatientMetrics2(patient: Patient.MOCK_Patients.first!)
//}
