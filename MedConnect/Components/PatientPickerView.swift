//
//  PatientPickerView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 12.05.2025.
//

import SwiftUI

struct PatientPickerView: View {
    @State var search: String = ""
    @Binding var selectedPatient: Patient?
    @Environment(\.dismiss) var dismiss
    let patients: [Patient]
    var body: some View {
        ScrollView {
            ForEach(searchPatients) { patient in
                PatientScrollCardView(patient: patient, showImage: false)
                    .onTapGesture {
                        selectedPatient = patient
                        dismiss()
                    }
                Divider()
            }
        }
        .searchable(text: $search)
    }
    var searchPatients: [Patient] {
        if search.isEmpty {
            return Patient.MOCK_Patients
        } else {
            return Patient.MOCK_Patients.filter {$0.name.localizedCaseInsensitiveContains(search)}
        }
    }
}

#Preview {
    PatientPickerView(selectedPatient: .constant(nil), patients: Patient.MOCK_Patients)
}
