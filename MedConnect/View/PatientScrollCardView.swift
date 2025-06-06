//
//  PatientCardView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.01.2025.
//

import SwiftUI

struct PatientScrollCardView: View {
    let patient: Patient
    var showImage: Bool = true
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.fill")
                Text(patient.surname)
                Text(patient.name)
                Text(patient.patronymic)
                Spacer()
                if showImage {
                    Image(systemName: "chevron.right")
                }
            }
            HStack {
                Image(systemName: "list.clipboard")
                    .foregroundStyle(.secondary)
                Text(patient.disease)
                    .foregroundStyle(.secondary)
                Spacer()
            }
        }
        .padding()
       
    }
}

//#Preview {
//    PatientCardView(patient: Patient.MOCK_Patients.first!)
//}
