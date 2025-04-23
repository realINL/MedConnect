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
                    PatientHW(medicalRecord: medicalRecord)
                    PatientMetrics(medicalRecord: medicalRecord)
                    PatientMetrics2(medicalRecord: medicalRecord, capriniIsPresented: $capriniIsPresented, charlosIsPresented: $charlosIsPresented)
                    PatientDisease(medicalRecord: medicalRecord)
                    PatientCT(medicalRecord: medicalRecord)
                    PatientRT(medicalRecord: medicalRecord)
                    ConcomitantDiseaseView()
                }
            }
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
