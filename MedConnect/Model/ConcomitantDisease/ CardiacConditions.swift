//
//  CardioDisease.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

struct CardiacConditions: Codable {
    var ibs: IschemicHeartDisease
    var hypertension: Hypertension
    var conductionDisorders: ConductionDisorders
    var peripheralAtherosclerosis: PeripheralAtherosclerosis
    var aorticAneurysm: AorticAneurysm
    var chf: HeartFailure
    var valveDefects: ValveDefects
    var cardiomyopathy: Bool
}

extension CardiacConditions {
    static let MOCK_CardiacConditions = CardiacConditions(ibs: .none, hypertension: .stage1, conductionDisorders: .leftBundleBranchBlock, peripheralAtherosclerosis: .legArteryStenosisOver70NoRevasc, aorticAneurysm: .chronicWithoutRepair, chf: .lvef50andAbove, valveDefects: .none, cardiomyopathy: false)
}
