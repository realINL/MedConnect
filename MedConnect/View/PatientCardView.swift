//
//  PatientCardView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.01.2025.
//

import SwiftUI

struct PatientCardView: View{
    let patient: Patient
    let medicalRecord: MedicalRecord
    
    init(patient: Patient) {
        self.patient = patient
        self.medicalRecord = MedicalRecord.MOCK_MedicalRecords[Int(patient.id)!]
    }
    @State var capriniIsPresented: Bool = false
    @State var charlosIsPresented: Bool = false
    @State var isEditing: Bool = false
    var body: some View {
        
//        
//        if isEditing {
//            MedCardEditView(medCardEditViewModel: MedCardEditViewModel())
//                .navigationBarBackButtonHidden()
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .primaryAction) {
//                        Button("Сохранить") {
//                            // Сохранение данных
//                        }
//                        .font(.headline)
//                    }
//                    ToolbarItem(placement: .cancellationAction) {
//                        Button("Отменить") {
//                            withAnimation {
//                                isEditing = false
//                            }
//                        }
//                    }
//                }
//        } else {
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
                        SurgeriesView(surgeries: medicalRecord.surgery)
                        Postoperative(postoperativeCourse: medicalRecord.postoperativeCourse)
                        HospitalComplicationsView(hospitalComplications: medicalRecord.hospitalComplications)
                        PathomorphologyDetails(pathomorphology: medicalRecord.pathomorphology)
                    

                    }
                }
            }
            .navigationTitle("Карта пациента")
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        MedCardEditView(medCardEditViewModel: MedCardEditViewModel())
                    } label: {
                        Image(systemName: "pencil.circle")
                    }
                }
            }
//        }
    }
    
    
}

#Preview {
    PatientCardView(patient: Patient.MOCK_Patients.first!)
}
