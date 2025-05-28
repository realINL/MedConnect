//
//  NetworkManager.swift
//  MedConnect
//
//  Created by Илья Лебедев on 12.05.2025.
//

import Foundation

protocol NetworkManagerProtocol {
    func uploadPatient(_ patient: Patient,  medcard: MedicalRecord) async throws
    func getPatients() async throws -> [Patient]
    func updatePatient(_ patient: Patient) async throws
    
    func getSurgeies() async throws -> [Surgery]
    func uploadSurgery(surgery: Surgery) async throws
    func updateSurgery(surgery: Surgery) async throws
    
    func getMedicalRecordById(_ recordId: String) async throws -> MedicalRecord?
    func updateMedicalRecord(_ medicalRecord: MedicalRecord) async throws
}

class FakeNetworkManager: NetworkManagerProtocol {
   
    init() {}
    
    var patients: [String: Patient] = Dictionary(uniqueKeysWithValues: Patient.MOCK_Patients.map( {($0.id, $0)} ))
    
    var surgeies: [String: Surgery] = [Surgery.MOCK_Surgery.id: Surgery.MOCK_Surgery]
    
    var medicalRecords: [MedicalRecord] = MedicalRecord.MOCK_MedicalRecords
    
    // MARK: Patient CRUD
    
    func uploadPatient(_ patient: Patient, medcard: MedicalRecord) async throws {
        self.patients[patient.id] = patient
    }
    
    func getPatients() -> [Patient] {
        return Array(patients.values)
    }
    
    func updatePatient(_ patient: Patient) async throws {
        self.patients[patient.id] = patient
    }
    
    
    
    // MARK: Surgery CRUD
    
    func createPatient(_ surgery: Surgery) {
        self.surgeies[surgery.id] = surgery
    }
    
    func getSurgeies() async throws -> [Surgery] {
        return Array(surgeies.values)
    }
    
    func uploadSurgery(surgery: Surgery) async throws  {
        self.surgeies[surgery.id] = surgery
    }
    
    func updateSurgery(surgery: Surgery) async throws  {
        self.surgeies[surgery.id] = surgery
    }
        
    // MARK: MedicalRecord CRUD
    func getMedicalRecordById(_ recordId: String) async throws -> MedicalRecord? {
        return self.medicalRecords.first(where: { $0.id == recordId })
    }
    
    func updateMedicalRecord(_ medicalRecord: MedicalRecord) async throws {
        
    }
    
    // MARK: Statistics CRUD
    
}
