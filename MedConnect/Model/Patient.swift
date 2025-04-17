//
//  Patient.swift
//  MedConnect
//
//  Created by Илья Лебедев on 15.01.2025.
//

import Foundation

struct Patient: Identifiable, Hashable, Codable {
    let id: String
    let name: String
    let surname: String
    let patronymic: String
    let age: Int
    let disease: String
    
    var hospital: String = ""
    var hospitalPart: String = ""
    var weight: Double = 0.0
    var height: Int = 0
    var asaIndex: Int = 0
    var ecogIndex: Int = 0
    var karnoskiyIndex: Int = 0
    var capriniIndex: Int = 0
    var chrlsonIndex: Int = 0
}

extension Patient {
    static let MOCK_Patients = [Patient(id: "0", name: "Иван", surname: "Иванов", patronymic: "Иванович", age: 57, disease: "Рак желудка", hospital: "МНИОИ им. П.А. Герцена", hospitalPart: "Торакальное отделение", weight: 82.0, height: 178, asaIndex: 3, ecogIndex: 2, karnoskiyIndex: 60, capriniIndex: 2, chrlsonIndex: 90),
                                Patient(id: "1", name: "Петр", surname: "Петров", patronymic: "Петрович", age: 43, disease: "Шизофрения"),
                                Patient(id: "2", name: "John", surname: "Doe", patronymic: "", age: 53, disease: "Шизофрения")]
}
