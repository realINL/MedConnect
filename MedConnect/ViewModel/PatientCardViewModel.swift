//
//  PatientCardViewModel.swift
//  MedConnect
//
//  Created by Илья Лебедев on 28.05.2025.
//

import Foundation

class PatientCardViewModel: ObservableObject {
    @Published var isLoading: Bool
    @Published var medicalRecord: MedicalRecord?
    @Published var patient: Patient
    
    let networkManager: NetworkManagerProtocol
    let localManager: LocalManagerProtocol
    
    init(networkManager: NetworkManagerProtocol, localManager: LocalManagerProtocol, patient: Patient) {
        self.isLoading = true
        self.networkManager = networkManager
        self.localManager = localManager
        self.patient = patient
        Task { await fetchMedicalRecord(patient.medicalRecordId) }
    }
    
    @MainActor
    func fetchMedicalRecord(_ recordId: String) async {
        self.isLoading = true
        do {
            let fetchedRecord = try await networkManager.getMedicalRecordById(recordId)
            self.medicalRecord = fetchedRecord
        } catch {
            print("Failed to fetch medCard: \(error)")
        }
        self.isLoading = false
    }
}
