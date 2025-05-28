//
//  Chemotherapy.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import Foundation

struct Chemotherapy: Identifiable, Hashable, Codable {
    var id: String
    var patientId: String
    
    var status: ChemotherapyStatus
    var scheme: String?
    
    var numberOfCourses: Int
    var startDate: Date
    var endDate: Date
}

extension Chemotherapy {
    static let MOCK_Chemotherapy: [Chemotherapy] = [Chemotherapy(id: "0",
                                                                 patientId: "0",
                                                                 status: .completed,
                                                                 scheme: ChemotherapyScheme.FLOT.rawValue,
                                                                 numberOfCourses: 3,
                                                                 startDate: Date.fromString("11.11.2021")!,
                                                                 endDate: Date.fromString("11.12.2021")!),
                                                    Chemotherapy(id: "1",
                                                                patientId: "1",
                                                                status: .partially,
                                                                 scheme: ChemotherapyScheme.custom.rawValue,
                                                                numberOfCourses: 1,
                                                                startDate: Date.fromString("11.11.2021")!,
                                                                endDate: Date.fromString("11.12.2021")!),
                                                    Chemotherapy(id: "2",
                                                                patientId: "2",
                                                                status: .none,
                                                                numberOfCourses: 0,
                                                                startDate: Date.fromString("11.11.2021")!,
                                                                endDate: Date.fromString("11.12.2021")!)
                                                    
    
    ]
}

enum ChemotherapyStatus: String, Codable, Hashable {
    case none = "Не проведена"
    case partially = "Проведена частично"
    case completed = "Проведена полностью"
    
   
}

enum ChemotherapyScheme: String, Codable, Hashable, CaseIterable {
    case FLOT = "FLOT"
    case FOLFOX = "FOLFOX"
    case XELOX = "XELOX"
    case custom = "Другое"
    
}
