//
//  Patient.swift
//  MedConnect
//
//  Created by Илья Лебедев on 15.01.2025.
//

import Foundation

struct Patient: Identifiable, Hashable, Codable {
    var id: String
    var medicalRecordId: String = ""
    
    var name: String
    var surname: String
    var patronymic: String
    var birthDate: Date
    
    var disease: String
    var concomitantDisease: ConcomitantDisease
    
    var hospital: String = ""
    var hospitalDepartment: String = ""
    
    var sex: Sex
    let age: Int
    var weight: Double = 0.0
    var height: Int = 0
    
    var asaIndex: Int = 0
    var ecogIndex: Int = 0
    var karnofskyIndex: Int = 0
    var capriniIndex: Int = 0
    var chrlsonIndex: Int = 0
    var weightLoss: Bool = false
}

extension Patient {
    static let MOCK_Patients = [Patient(id: "0", 
                                        name: "Иван",
                                        surname: "Иванов",
                                        patronymic: "Иванович",
                                        birthDate: Date.fromString("13.01.1956")!,
                                        disease: "Рак желудка",
                                        concomitantDisease: ConcomitantDisease.MOCK_ConcomitantDisease,
                                        hospital: "МНИОИ им. П.А. Герцена", 
                                        hospitalDepartment: "Торакальное отделение", 
                                        sex: .male,
                                        age: 57,
                                        weight: 82.0,
                                        height: 178,
                                        asaIndex: 3,
                                        ecogIndex: 2,
                                        karnofskyIndex: 60,
                                        capriniIndex: 2,
                                        chrlsonIndex: 90,
                                        weightLoss: true),
                                
                                Patient(id: "1", 
                                        name: "Петр",
                                        surname: "Петров",
                                        patronymic: "Петрович",
                                        birthDate: Date.now,
                                        disease: "Рак желудка",
                                        concomitantDisease: ConcomitantDisease.MOCK_ConcomitantDisease,
                                        hospital: "МНИОИ им. П.А. Герцена",
                                        hospitalDepartment: "Торакальное отделение", 
                                        sex: .male,
                                        age: 43),
                                
                                Patient(id: "2", 
                                        name: "John",
                                        surname: "Doe",
                                        patronymic: "",
                                        birthDate: Date.now,
                                        disease: "Рак желудка",
                                        concomitantDisease: ConcomitantDisease.MOCK_ConcomitantDisease,
                                        hospital: "МНИОИ им. П.А. Герцена",
                                        hospitalDepartment: "Торакальное отделение", 
                                        sex: .male,
                                        age: 40)]
    
    var surnameInitials: String {
        return "\(self.surname) \(self.name.firstLetter). \(self.patronymic.firstLetter)."
    }
}
