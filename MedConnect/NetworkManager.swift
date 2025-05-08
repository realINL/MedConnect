//
//  NetworkManager.swift
//  MedConnect
//
//  Created by Илья Лебедев on 12.05.2025.
//

import Foundation

protocol NetworkManager {
    func getPatients() -> [Patient]
    func getSurgeies() -> [Surgery]
    func uploadSurgery(surgery: Surgery)
}

class FakeNetworkManager: NetworkManager {
    
    
    init() {}
    
    var patients: [String: Patient] = Dictionary(uniqueKeysWithValues: Patient.MOCK_Patients.map( {($0.id, $0)} ))
    
    var surgeies: [String: Surgery] = [Surgery.MOCK_Surgery.id: Surgery.MOCK_Surgery]
    
    // MARK: Patient CRUD
    
    func createPatient(_ patient: Patient) {
        self.patients[patient.id] = patient
    }
    
    func getPatients() -> [Patient] {
        return Array(patients.values)
    }
    
    func updatePatient(_ patient: Patient) {
        self.patients[patient.id] = patient
    }
    
    
    
    // MARK: Surgery CRUD
    
    func createPatient(_ surgery: Surgery) {
        self.surgeies[surgery.id] = surgery
    }
    
    func getSurgeies() -> [Surgery] {
        return Array(surgeies.values)
    }
    
    func uploadSurgery(surgery: Surgery)  {
        self.surgeies[surgery.id] = surgery
    }
        
    // MARK: Statistics CRUD
    
}
