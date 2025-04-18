//
//  concomitantВisease.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

struct ConcomitantDisease: Codable {
    var cardiacConditions: CardiacConditions
    var pulmonaryDiseases: PulmonaryDiseases
    var endocrineDiseases: EndocrineDiseases
    var ChronicKidneyDisease: Bool
}
