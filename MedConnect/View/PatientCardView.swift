//
//  PatientCardView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.01.2025.
//

import SwiftUI

struct PatientCardView: View {
    let patient: Patient
    let medicalRecord: MedicalRecord
    
    init(patient: Patient) {
        self.patient = patient
        self.medicalRecord = MedicalRecord.MOCK_MedicalRecord[Int(patient.id)!]
    }
    @State var capriniIsPresented: Bool = false
    @State var charlosIsPresented: Bool = false
    var body: some View {
        VStack{
            PatienHeaderInfo(patient: patient)
            ScrollView {
                VStack(spacing: 10) {
                    PatientHW(patient: patient)
                    PatientMetrics(patient: patient)
                    PatientMetrics2(patient: patient, capriniIsPresented: $capriniIsPresented, charlosIsPresented: $charlosIsPresented)
                    PatientDisease(medicalRecord: medicalRecord)
                    PatientCT(medicalRecord: medicalRecord)
                    PatientRT(medicalRecord: medicalRecord)
                    ConcomitantDiseaseView()
                }
            }
        }
        .popover(isPresented: $capriniIsPresented) {
            CapriniCalculatorView(viewModel: CapriniCalculatorViewModel(patient: patient))
        }
        .navigationTitle("Карта пациента")
        .toolbar {
            ToolbarItem {
                Button {
                    
                } label: {
                    Image(systemName: "pencil.circle")
                }
            }
        }
    }
}

#Preview {
    PatientCardView(patient: Patient.MOCK_Patients.first!)
}
