//
//  ConfirmationEdit.swift
//  MedConnect
//
//  Created by Илья Лебедев on 28.05.2025.
//

import SwiftUI

struct ConfirmationEdit: View {
    @ObservedObject var viewModel: MedCardEditViewModel
    var body: some View {
        Section("Сохранение") {
            Button("Обновить медкарту") {
                viewModel.showConfirmAlert.toggle()
            }
            
            Button("Сохранить как черновик") {
                
            }
        }
       
    }
}

#Preview {
    Form {
        ConfirmationEdit(viewModel:MedCardEditViewModel(medicalRecord: MedicalRecord.MOCK_MedicalRecords[0], patient: Patient.MOCK_Patients[0], networkManager: FakeNetworkManager(), localManager: FakeLocalManager())) }
}
