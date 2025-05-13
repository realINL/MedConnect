//
//  PatientCardView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.01.2025.
//

import SwiftUI

struct PatientCardView: View{
//    let patient: Patient
//    let medicalRecord: MedicalRecord
    @ObservedObject var viewModel: PatientCardViewModel
    
    init(patient: Patient, networkManager: NetworkManagerProtocol, localManager: LocalManagerProtocol) {
        self.viewModel = PatientCardViewModel(networkManager: networkManager, localManager: localManager, patient: patient)
    }
    
//    init(patient: Patient, medicalRecord: MedicalRecord) {
//        self.patient = patient
//        self.medicalRecord = medicalRecord
//    }
    
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
        if viewModel.isLoading {
            ProgressView()
        } else if let medicalRecord = viewModel.medicalRecord {
        VStack{
            PatienHeaderInfo(patient: viewModel.patient)
                ScrollView {
                    VStack(spacing: 10) {
                        PatientHW(medicalRecord: medicalRecord)
                        PatientMetrics(medicalRecord: medicalRecord)
                        PatientMetrics2(medicalRecord: medicalRecord, capriniIsPresented: $capriniIsPresented, charlosIsPresented: $charlosIsPresented)
                        PatientDisease(medicalRecord: medicalRecord)
                        PatientCT(medicalRecord: medicalRecord)
                        PatientRT(medicalRecord: medicalRecord)
                        ConcomitantDiseaseView(medicalRecord: medicalRecord)
                        SurgeriesView(surgeries: medicalRecord.surgery)
                        Postoperative(postoperativeCourse: medicalRecord.postoperativeCourse)
                        HospitalComplicationsView(hospitalComplications: medicalRecord.hospitalComplications)
                        PathomorphologyDetails(pathomorphology: medicalRecord.pathomorphology)
                    }
                }
            }
            .navigationTitle("Карта пациента")
            .toolbar {
                if viewModel.medicalRecord != nil {
                    ToolbarItem {
                        NavigationLink {
                            MedCardEditView(medCardEditViewModel: MedCardEditViewModel(medicalRecord: viewModel.medicalRecord!,
                                                                                       patient: viewModel.patient,
                                                                                       networkManager: viewModel.networkManager,
                                                                                       localManager: viewModel.localManager))
                        } label: {
                            Image(systemName: "pencil.circle")
                        }
                    }
                }
            }
        }
        else {
            Text("error")
        }
    }
    
    
}

//#Preview {
//    PatientCardView(patient: Patient.MOCK_Patients.first!)
//}
