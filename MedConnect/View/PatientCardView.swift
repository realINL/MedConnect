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
        VStack{
            PatienHeaderInfo(patient: patient)
            ScrollView {
                VStack(spacing: 10) {
                    PatientHW(patient: patient)
                    PatientMetrics(patient: patient)
                    PatientMetrics2(patient: patient)
                    PatientDisease()
                    Text("Сопутсвующие заболевания")
                    //                Spacer()
                }
            }
        }
    }
}

#Preview {
    PatientCardView(patient: Patient.MOCK_Patients.first!)
}
