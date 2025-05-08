//
//  LocalManager.swift
//  MedConnect
//
//  Created by Илья Лебедев on 13.05.2025.
//

import Foundation

protocol LocalManager {
    func createSurgeryDraft(_ surgery: Surgery)
    func getSurgiesDrafts() -> [Surgery]
    func editSurgeryDraft(_ surgery: Surgery)
    func deleteSurgeryDraft(at indexes: IndexSet)
    
    func createMedicalRecordDraft(_ medicalRecord: MedicalRecord)
    func getMedicalRecordsDrafts() -> [MedicalRecord]
    func editMedicalRecordDraft(_ medicalRecord: MedicalRecord)
    func deleteMedicalRecordDraft(_ medicalRecord: MedicalRecord)
}

class FakeLocalManager: LocalManager {
    var surgiesDrafts: [String: Surgery]
    var medicalRecordsDrafts: [String: MedicalRecord]
    
    init() {
        self.surgiesDrafts = [Surgery.MOCK_Surgery_Draft.id: Surgery.MOCK_Surgery_Draft]
        self.medicalRecordsDrafts = [MedicalRecord.MOCK_MedicalRecords.first!.id: MedicalRecord.MOCK_MedicalRecords.first!]
    }
    
    func createSurgeryDraft(_ surgery: Surgery) {
        surgiesDrafts[surgery.id] = surgery
    }
    
    func getSurgiesDrafts() -> [Surgery] {
        return Array(surgiesDrafts.values)
    }
    
    func editSurgeryDraft(_ surgery: Surgery) {
        surgiesDrafts[surgery.id] = surgery
    }
    
    func deleteSurgeryDraft(at indexes: IndexSet) {
        let drafts = Array(surgiesDrafts.values)
        indexes.forEach { index in
            let draftToDelete = drafts[index]
            surgiesDrafts.removeValue(forKey: draftToDelete.id)
        }
    }
    
    
    
    func createMedicalRecordDraft(_ medicalRecord: MedicalRecord) {
        medicalRecordsDrafts[medicalRecord.id] = medicalRecord
    }
    
    func getMedicalRecordsDrafts() -> [MedicalRecord] {
        return Array(medicalRecordsDrafts.values)
    }
    
    func editMedicalRecordDraft(_ medicalRecord: MedicalRecord) {
        medicalRecordsDrafts[medicalRecord.id] = medicalRecord
    }
    
    func deleteMedicalRecordDraft(_ medicalRecord: MedicalRecord) {
        medicalRecordsDrafts.removeValue(forKey: medicalRecord.id)
    }
    
    
}
