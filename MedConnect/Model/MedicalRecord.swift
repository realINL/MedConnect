//
//  MedicalRecord.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import Foundation
 
struct MedicalRecord: Identifiable, Hashable, Codable {
    let id: String
    
    let patientId: String
    
    let age: Int
    var weight: Double = 0.0
    var height: Int = 0
    
    var asaIndex: Int = 0
    var ecogIndex: Int = 0
    var karnofskyIndex: Int = 0
    var capriniIndex: Int = 0
    var chrlsonIndex: Int = 0
    var weightLoss: Bool = false
    
//    var disease: any Disease
}
