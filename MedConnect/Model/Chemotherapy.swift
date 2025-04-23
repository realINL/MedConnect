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
    
    var staus: ChemotherapyStatus
    
    var numberOfCourses: Int
    var startDate: Date
    var endDate: Date
}

extension Chemotherapy {
    static let MOCK_Chemotherapy: [Chemotherapy] = [Chemotherapy(id: "0",
                                                                 patientId: "0",
                                                                 staus: .completed(scheme: .FLOT, endDate: Date.fromString("11.12.2021")!),
                                                                 numberOfCourses: 3,
                                                                 startDate: Date.fromString("11.11.2021")!,
                                                                 endDate: Date.fromString("11.12.2021")!),
                                                    Chemotherapy(id: "1",
                                                                  patientId: "1",
                                                                  staus: .partially,
                                                                  numberOfCourses: 1,
                                                                  startDate: Date.fromString("11.11.2021")!,
                                                                  endDate: Date.fromString("11.12.2021")!),
                                                    Chemotherapy(id: "2",
                                                                patientId: "2",
                                                                staus: .none,
                                                                numberOfCourses: 0,
                                                                startDate: Date.fromString("11.11.2021")!,
                                                                endDate: Date.fromString("11.12.2021")!)
                                                    
    
    ]
}

enum ChemotherapyStatus: Codable, Hashable {
    case none
    case partially
    case completed(scheme: ChemotherapyScheme, endDate: Date)
    
    var description: String {
            switch self {
            case .none:
                return "Не проведена"
            case .partially:
                return "Проведена частично"
            case .completed(let scheme, let endDate):
                return "Проведена полностью (\(scheme.description))"
            }
        }
}

enum ChemotherapyScheme: Codable, Hashable {
    case FLOT
    case FOLFOX
    case XELOX
    case custom(String)
    
    var description: String {
            switch self {
            case .FLOT: return "FLOT"
            case .FOLFOX: return "FOLFOX"
            case .XELOX: return "XELOX"
            case .custom(let title): return title
            }
        }
}
