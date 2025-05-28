//
//  NetworkManager.swift
//  MedConnect
//
//  Created by Илья Лебедев on 27.05.2025.
//

import Foundation
import Firebase
import FirebaseFirestore

class NetworkManager: NetworkManagerProtocol, ObservableObject {
    func uploadSurgery(surgery: Surgery) async throws {
        let ref = dataBase.collection(self.surgiesRecordsCollection).document(surgery.id)
        guard let encodedSurgery = try? Firestore.Encoder().encode(surgery) else { return }
        
        try await ref.setData(encodedSurgery)
    }
    
   
    let dataBase = Firestore.firestore()
    
    // MARK: Patients
    private let patientsCollection: String = "Patients"
    
    func uploadPatient(_ patient: Patient, medcard: MedicalRecord) async throws {
        let refPatient = dataBase.collection(self.patientsCollection).document()
        let refRecord = dataBase.collection(self.medicalRecordsCollection).document()
        var newPatient = patient
        var newRecord = medcard
        
        newPatient.id = refPatient.documentID
        newRecord.id = refRecord.documentID
        newRecord.patientId = refPatient.documentID
        newPatient.medicalRecordId = refRecord.documentID
        
        guard let encodedPatient = try? Firestore.Encoder().encode(newPatient) else { print("e p"); return }
        guard let encodedRecord = try? Firestore.Encoder().encode(newRecord) else { print ("e r"); return }
        
        try await refPatient.setData(encodedPatient)
        try await refRecord.setData(encodedRecord)
        
        print("upload patient")
    }
    
    func getPatients() async throws -> [Patient]  {
        var patients = [Patient]()
        let snapshot = try await dataBase.collection("Patients").getDocuments()
        let documents = snapshot.documents
        
        for doc in documents {
            guard let patient = try? doc.data(as: Patient.self) else { continue }
            
            patients.append(patient)
        }
        print("nw get patients")
        return patients
    }
    
    func updatePatient(_ patient: Patient) async throws {
        let ref = dataBase.collection(self.patientsCollection).document(patient.id)
        guard let encodedPatient = try? Firestore.Encoder().encode(patient) else { return }
        
        try await ref.setData(encodedPatient)
    }
    
    func getSurgeies() -> [Surgery] {
        return [Surgery.MOCK_Surgery]
    }
    
    
    
    // MARK: Medical Records
    private let medicalRecordsCollection: String = "MedicalRecords"
    
    func uploadMedicalRecord(_ medicalRecord: MedicalRecord) async throws {
        let ref = dataBase.collection(self.medicalRecordsCollection).document()
        var newRecord = medicalRecord
        newRecord.id = ref.documentID
        guard let encodedRecord = try? Firestore.Encoder().encode(newRecord) else { return }
        
        try await ref.setData(encodedRecord)
    }
    
    func getMedicalRecordById(_ recordId: String) async throws -> MedicalRecord? {
        print("get medcard \(recordId)")
        let snapshot = try await dataBase.collection(self.medicalRecordsCollection).document(recordId).getDocument()
        guard let record = try? snapshot.data(as: MedicalRecord.self) else { return nil }
        var newRecord = record
        try await newRecord.surgery = getSurgeiesByPatientId(patientId: record.patientId)
        return newRecord
    }
    
    func updateMedicalRecord(_ medicalRecord: MedicalRecord) async throws {
        let ref = dataBase.collection(self.medicalRecordsCollection).document(medicalRecord.id)
        guard let encodedRecord = try? Firestore.Encoder().encode(medicalRecord) else { return }
        
        try await ref.setData(encodedRecord)
    }
    
    // MARK: Surgies
    
    private let surgiesRecordsCollection: String = "Surgies"
    
    func getSurgeies() async throws -> [Surgery] {
        var surgies = [Surgery]()
        let snapshot = try await dataBase.collection(self.surgiesRecordsCollection).getDocuments()
        let documents = snapshot.documents
        
        for doc in documents {
            guard let surgery = try? doc.data(as: Surgery.self) else { continue }
            
            surgies.append(surgery)
        }
        print("get surgies")
        return surgies
    }
    
    func getSurgeiesByPatientId(patientId: String) async throws -> [Surgery] {
        var surgies = [Surgery]()
        let snapshot = try await dataBase.collection(self.surgiesRecordsCollection).whereField("patientId", isEqualTo: patientId).getDocuments()
        let documents = snapshot.documents
        
        for doc in documents {
            guard let surgery = try? doc.data(as: Surgery.self) else { continue }
            
            surgies.append(surgery)
        }
        print("get surgies")
        return surgies
    }
    
    func uploadSurgey(surgery: Surgery) async throws  {
        let ref = dataBase.collection(self.surgiesRecordsCollection).document()
        var newSurgery = surgery
        newSurgery.id = ref.documentID
        guard let encodedSurgery = try? Firestore.Encoder().encode(newSurgery) else { return }
        
        try await ref.setData(encodedSurgery)
    }
    
    func updateSurgery(surgery: Surgery) async throws {
        let ref = dataBase.collection(self.surgiesRecordsCollection).document(surgery.id)
        guard let encodedSurgery = try? Firestore.Encoder().encode(surgery) else { return }
        
        try await ref.setData(encodedSurgery)
    }
    
//    func updateSurgery(surgery: Surgery) async throws  {
//        let ref = dataBase.collection(self.surgiesRecordsCollection).document(surgery.id)
//        guard let encodedSurgery = try? Firestore.Encoder().encode(surgery) else { return }
//        
//        try await ref.setData(encodedSurgery)
//    }
    
}
