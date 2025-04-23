//
//  concomitantВisease.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

struct ConcomitantDisease: Codable, Hashable {
    
    var cardiacConditions: CardiacConditions
    var pulmonaryDiseases: PulmonaryDiseases
    var endocrineDiseases: EndocrineDiseases
    var сhronicKidneyDisease: YesNo
}

extension ConcomitantDisease {
    static let MOCK_ConcomitantDisease: ConcomitantDisease = ConcomitantDisease(cardiacConditions: CardiacConditions.MOCK_CardiacConditions, pulmonaryDiseases: .bronchialAsthma, endocrineDiseases: EndocrineDiseases.MOCK_EndocrineDiseases, сhronicKidneyDisease: .no)
}
