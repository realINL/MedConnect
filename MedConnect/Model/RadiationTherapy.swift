//
//  RadiationTherapy.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import Foundation

struct RadiationTherapy: Identifiable, Hashable, Codable {
    var id: String
    var patientId: String
    
    var status: RadiationTherapyStatus
    
    var startDate: Date
    var endDate: Date
    
    var sfd: Double?
    var tfd: Double?
}

extension RadiationTherapy {
    static let MOCK_RadiationTherapy: [RadiationTherapy] = [RadiationTherapy(id: "0", patientId: "0", 
                                                                             status: 
            .completed(sfd: 5, tfd: 25),
                                                                             startDate: Date.fromString("11.11.2021")!, endDate: Date.fromString("11.12.2021")!, sfd: 5, tfd: 25)]
}


enum RadiationTherapyStatus: Codable, Hashable {
    case none
    case partially
    case completed(sfd: Double, tfd: Double)
    
    var description: String {
        switch self {
        case .none: return "Не проведена"
        case .partially: return "Проведена частично"
        case .completed(sfd: let sfd, tfd: let tfd): return "Проведена полностью"
        }
    }
}

