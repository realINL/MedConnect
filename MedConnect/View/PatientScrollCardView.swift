//
//  PatientCardView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 04.02.2025.
//

import SwiftUI

struct PatientScrollCardView: View {
    let patient: Patient
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.fill")
                Text(patient.surname)
                Text(patient.name)
                Text(patient.patronymic)
                Spacer()
                Image(systemName: "chevron.right")
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
//    PatientCardView()
//}
