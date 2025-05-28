//
//  LocalManager.swift
//  MedConnect
//
//  Created by Илья Лебедев on 13.05.2025.
//

import Foundation

protocol LocalManagerProtocol {
    func createSurgeryDraft(_ surgery: Surgery) throws
    func getSurgiesDrafts() throws -> [Surgery]
    func editSurgeryDraft(_ surgery: Surgery)
    func deleteSurgeryDraft(at indexes: IndexSet,  drafts: [Surgery]) throws
    
    func createMedicalRecordDraft(_ medicalRecord: MedicalRecord) throws
    func getMedicalRecordsDrafts() throws -> [MedicalRecord]
    func editMedicalRecordDraft(_ medicalRecord: MedicalRecord)
    func deleteMedicalRecordDraft(_ medicalRecord: MedicalRecord)
}

class FakeLocalManager: LocalManagerProtocol {
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
    
    func deleteSurgeryDraft(at indexes: IndexSet, drafts: [Surgery]) {
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

class LocalManager: LocalManagerProtocol {
    private var surgeriesDraftsFolderURL: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("SurgeryDrafts")
    }
    
    private var mrDraftsFolderURL: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("mrDrafts")
    }
    
    func createSurgeryDraft(_ surgery: Surgery) throws {
        let fileName: String = surgery.id
        // Создать папку, если ее нет
        if !FileManager.default.fileExists(atPath: surgeriesDraftsFolderURL.path) {
            try FileManager.default.createDirectory(
                at: surgeriesDraftsFolderURL,
                withIntermediateDirectories: true
            )
        }
        
        // Путь к файлу
        let fileURL = surgeriesDraftsFolderURL.appendingPathComponent("\(fileName).json")
        
        // Кодировать и сохранить
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601  // Для правильного сохранения Date
        let data = try encoder.encode(surgery)
        try data.write(to: fileURL, options: [.atomic])  // Запись атомарно
    }
    
    func getSurgiesDrafts() throws -> [Surgery]  {
        // Проверяем, существует ли папка
        guard FileManager.default.fileExists(atPath: surgeriesDraftsFolderURL.path) else {
            return []  // Если папки нет, значит черновиков тоже нет
        }
        
        // Получаем список всех файлов в папке
        let fileURLs = try FileManager.default.contentsOfDirectory(
            at: surgeriesDraftsFolderURL,
            includingPropertiesForKeys: nil
        )
        
        // Фильтруем только JSON-файлы
        let jsonFiles = fileURLs.filter { $0.pathExtension == "json" }
        
        // Декодируем каждый файл в Surgery
        var drafts: [Surgery] = []
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        for fileURL in jsonFiles {
            do {
                let data = try Data(contentsOf: fileURL)
                let draft = try decoder.decode(Surgery.self, from: data)
                drafts.append(draft)
            } catch {
                print("⚠️ Ошибка при чтении файла \(fileURL.lastPathComponent): \(error)")
                // Продолжаем обработку остальных файлов, даже если один битый
            }
        }
        
        return drafts
    }
    
    
    func editSurgeryDraft(_ surgery: Surgery) {
        do {
            try createSurgeryDraft(surgery)
        } catch {
            
        }
    }
    
    func deleteSurgeryDraft(at indexes: IndexSet, drafts: [Surgery]) throws {
        // Преобразуем IndexSet в массив индексов
        let indices = Array(indexes)
        
        // Удаляем каждый файл
        for index in indices {
            guard index < drafts.count else { continue }
            let fileURL = surgeriesDraftsFolderURL.appendingPathComponent("\(drafts[index].id).json")
            if FileManager.default.fileExists(atPath: fileURL.path) {
                try FileManager.default.removeItem(at: fileURL)
            }
        }
    }
    
    func createMedicalRecordDraft(_ medicalRecord: MedicalRecord) throws {
        let fileName: String = medicalRecord.id
        // Создать папку, если ее нет
        if !FileManager.default.fileExists(atPath: mrDraftsFolderURL.path) {
            try FileManager.default.createDirectory(
                at: surgeriesDraftsFolderURL,
                withIntermediateDirectories: true
            )
        }
        
        // Путь к файлу
        let fileURL = surgeriesDraftsFolderURL.appendingPathComponent("\(fileName).json")
        
        // Кодировать и сохранить
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601  // Для правильного сохранения Date
        let data = try encoder.encode(medicalRecord)
        try data.write(to: fileURL, options: [.atomic])  // Запись атомарно
    }
    
    func getMedicalRecordsDrafts() throws -> [MedicalRecord] {
        // Проверяем, существует ли папка
        guard FileManager.default.fileExists(atPath: mrDraftsFolderURL.path) else {
            return []  // Если папки нет, значит черновиков тоже нет
        }
        
        // Получаем список всех файлов в папке
        let fileURLs = try FileManager.default.contentsOfDirectory(
            at: mrDraftsFolderURL,
            includingPropertiesForKeys: nil
        )
        
        // Фильтруем только JSON-файлы
        let jsonFiles = fileURLs.filter { $0.pathExtension == "json" }
        
        // Декодируем каждый файл в Surgery
        var drafts: [MedicalRecord] = []
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        for fileURL in jsonFiles {
            do {
                let data = try Data(contentsOf: fileURL)
                let draft = try decoder.decode(MedicalRecord.self, from: data)
                drafts.append(draft)
            } catch {
                print("⚠️ Ошибка при чтении файла \(fileURL.lastPathComponent): \(error)")
                // Продолжаем обработку остальных файлов, даже если один битый
            }
        }
        
        return drafts
    }
    
    func editMedicalRecordDraft(_ medicalRecord: MedicalRecord) {
        
    }
    
    func deleteMedicalRecordDraft(_ medicalRecord: MedicalRecord) {
        
    }
    
    
}


extension Surgery {
    // Папка для черновиков
    private static var draftsFolderURL: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("SurgeryDrafts")
    }
    
    // Сохранить черновик
    static func saveDraft(_ draft: Surgery, fileName: String = "currentDraft") throws {
        // Создать папку, если ее нет
        if !FileManager.default.fileExists(atPath: draftsFolderURL.path) {
            try FileManager.default.createDirectory(
                at: draftsFolderURL,
                withIntermediateDirectories: true
            )
        }
        
        // Путь к файлу
        let fileURL = draftsFolderURL.appendingPathComponent("\(fileName).json")
        
        // Кодировать и сохранить
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601  // Для правильного сохранения Date
        let data = try encoder.encode(draft)
        try data.write(to: fileURL, options: [.atomic])  // Запись атомарно
    }
    
    // Загрузить черновик
    static func loadDraft(fileName: String = "currentDraft") throws -> Surgery? {
        let fileURL = draftsFolderURL.appendingPathComponent("\(fileName).json")
        
        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            return nil
        }
        
        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601  // Для корректного чтения Date
        return try decoder.decode(Surgery.self, from: data)
    }
    
    // Удалить черновик
    static func deleteDraft(fileName: String = "currentDraft") throws {
        let fileURL = draftsFolderURL.appendingPathComponent("\(fileName).json")
        if FileManager.default.fileExists(atPath: fileURL.path) {
            try FileManager.default.removeItem(at: fileURL)
        }
    }
}
