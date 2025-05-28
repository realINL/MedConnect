//
//  CreateSurgeryViewModel.swift
//  MedConnect
//
//  Created by Илья Лебедев on 11.05.2025.
//

import SwiftUI
import Foundation

class CreateSurgeryViewModel: ObservableObject {
    @Published var surgery: Surgery
    @Published var patients: [Patient] = []
    let networkManager: NetworkManagerProtocol
    let localManager: LocalManagerProtocol
    
    init(networkManager: NetworkManagerProtocol, localManager: LocalManagerProtocol) {
        self.surgery = Surgery()
        self.localManager = localManager
        self.networkManager = networkManager
        Task { try await getPatients() }
    }
    
    init(networkManager: NetworkManagerProtocol, localManager: LocalManagerProtocol, surgery: Surgery) {
        self.surgery = surgery
        self.localManager = localManager
        self.networkManager = networkManager
        Task { try await getPatients() }
    }
    
    @MainActor
    func getPatients() async throws  {
        do {
            let patients = try await networkManager.getPatients()
            print("Получены пациенты: \(patients.count) шт.")
            self.patients = patients
        } catch {
            print("Ошибка при загрузке пациентов: \(error)")
            throw error 
        }
    }
    
    func uploadSurgery() {
        surgery.lastChange = Date.now
        Task {
            try await networkManager.uploadSurgery(surgery: surgery)
        }
    }
    
    func saveDraft() {
        surgery.lastChange = Date.now
        do {try localManager.createSurgeryDraft(surgery)}
        catch {}
    }
    
    func updateID() {
        self.surgery.id = NSUUID().description
    }
    
    var shouldShowAnastomosisPicker: Bool {
        let hiddenCases: [String?] = [
            SurgeryProcedureType.doubleSingleFlap.rawValue,
            SurgeryProcedureType.bilrothI.rawValue,
            SurgeryProcedureType.reservoirJejunogastroplasty.rawValue
        ]
        return !hiddenCases.contains(surgery.surgeryVolume.procedureType)
    }
    
    var availableAnastomosisTypes: [AnastomosisType] {
        switch (surgery.surgeryVolume.procedureType,
                surgery.surgeryVolume.procrdureModification) {
            
        case (SurgeryProcedureType.doubleTract.rawValue, _):
            DispatchQueue.main.async { self.surgery.surgeryVolume.anastomosisType = AnastomosisType.esophagojejunoanastomosis.rawValue }
            return [.esophagojejunoanastomosis, .gastroenteroanastomosis, .interintestinalAnastomosis]
            
        case (SurgeryProcedureType.merendinoJejunalInterposition.rawValue, _):
            DispatchQueue.main.async { self.surgery.surgeryVolume.anastomosisType = AnastomosisType.esophagojejunoanastomosis.rawValue }
            return [.esophagojejunoanastomosis, .enterogastroanastomosis]
            
        case (SurgeryProcedureType.bilrothII.rawValue, SurgeryProcedureModification.rouxEnY.rawValue),
             (SurgeryProcedureType.bilrothII.rawValue, SurgeryProcedureModification.uncutRouxEnY.rawValue),
            (SurgeryProcedureType.bilrothII.rawValue, SurgeryProcedureModification.braunLoopAnastomosis.rawValue):
            DispatchQueue.main.async { self.surgery.surgeryVolume.anastomosisType = AnastomosisType.gastroenteroanastomosis.rawValue }
            return [.gastroenteroanastomosis, .interintestinalAnastomosis]
            
        case (SurgeryProcedureType.standardJejunogastroplasty.rawValue, _):
            DispatchQueue.main.async { self.surgery.surgeryVolume.anastomosisType = AnastomosisType.esophagoenteroanastomosis.rawValue }
            return [.esophagoenteroanastomosis, .enteroduedenoanastomosis]
            
        case (SurgeryProcedureType.rouxEnY.rawValue, _),
             (SurgeryProcedureType.uncutRouxEnY.rawValue, _),
             (SurgeryProcedureType.loopReconstruction.rawValue, _):
            DispatchQueue.main.async { self.surgery.surgeryVolume.anastomosisType = AnastomosisType.esophagoenteroanastomosis.rawValue }
            return [.esophagoenteroanastomosis, .interintestinalAnastomosis]
            
        default:
            return []
        }
    }
    
     
    
}
