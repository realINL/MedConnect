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
    static let MOCK_RadiationTherapy: [RadiationTherapy] = [RadiationTherapy(id: "0", 
                                                                             patientId: "0",
                                                                             status: .completed,
                                                                             startDate: Date.fromString("11.11.2021")!,
                                                                             endDate: Date.fromString("11.12.2021")!,
                                                                             sfd: 5,
                                                                             tfd: 25),
                                                            RadiationTherapy(id: "1",
                                                                             patientId: "1",
                                                                             status: .none,
                                                                             startDate: Date.fromString("11.11.2021")!,
                                                                             endDate: Date.fromString("11.12.2021")!,
                                                                             sfd: 2,
                                                                             tfd: 6),
                                                            RadiationTherapy(id: "2",
                                                                             patientId: "2",
                                                                             status: .partially,
                                                                             startDate: Date.fromString("11.11.2021")!,
                                                                             endDate: Date.fromString("11.12.2021")!,
                                                                             sfd: 4,
                                                                             tfd: 16)
    
    ]
}


enum RadiationTherapyStatus: String, Codable, Hashable, CaseIterable {
    case none = "Не проведена"
    case partially = "Проведена частично"
    case completed = "Проведена полностью"
    
}

