//
//  Operation.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

struct Operation: Identifiable, Codable, Hashable {
    let id: String
    
    let daysBeforeOperation: Int
    let access: String
    let operationVolume: String
    let CombinedProcedure: String
    let ExtentLymphadenectomy: String
    let Jejunostomy: Bool
    let IntraoperativeChemotherapy: String
    let Duration: Int
    let intraoperativeBloodLossVolume: Int
    let drainsNumber: Int
    let nasogastricJejunalTubePresence: Int
    let IntraoperativeComplications: String
}
