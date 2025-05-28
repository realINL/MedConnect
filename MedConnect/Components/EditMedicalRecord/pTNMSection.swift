//
//  pTNMSection.swift
//  MedConnect
//
//  Created by Илья Лебедев on 27.05.2025.
//

import SwiftUI

struct pTNMSection: View {
    @ObservedObject var viewModel: MedCardEditViewModel
    
    var body: some View {
        Section("Классификация pTNM") {
            NavigationLink {
                FullScreenPicker(selection: $viewModel.medicalRecord.pathomorphology.pTNM.pt, title: "pT", options: PT.allCases)
            } label: {
                HStack {
                    Text("pT")
                    Spacer()
                    Text(viewModel.medicalRecord.pathomorphology.pTNM.pt.shortCode)
                        .foregroundColor(.gray)
                }
            }
            
            NavigationLink {
                FullScreenPicker(selection: $viewModel.medicalRecord.pathomorphology.pTNM.cn, title: "pN", options: PN.allCases)
            } label: {
                HStack {
                    Text("pN")
                    Spacer()
                    Text(viewModel.medicalRecord.pathomorphology.pTNM.cn.shortCode)
                        .foregroundColor(.gray)
                }
            }
            
            NavigationLink {
                FullScreenPicker(selection: $viewModel.medicalRecord.pathomorphology.pTNM.cm, title: "pM", options: PM.allCases)
            } label: {
                HStack {
                    Text("pM")
                    Spacer()
                    Text(viewModel.medicalRecord.pathomorphology.pTNM.cm.shortCode)
                        .foregroundColor(.gray)
                }
            }
            
            LabeledValueRowReversed(value: viewModel.medicalRecord.pathomorphology.pTNM.stage, label: "Клиническая стадия")
        }
        .navigationTitle("Классификация PTNM")
    }
}

#Preview {
    Form {
        pTNMSection(viewModel: MedCardEditViewModel(medicalRecord: MedicalRecord.MOCK_MedicalRecords[0], patient: Patient.MOCK_Patients[0], networkManager: FakeNetworkManager(), localManager: FakeLocalManager())) }
}
