//
//  Diabetes.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

enum Diabetes: String, Codable {
    case none = ""
    case type1Compensated = "СД 1 типа компенсированный"
    case type1Uncompensated = "СД 1 типа НЕ компенсированный"
    case type2Compensated = "СД 2 типа компенсированный"
    case type2Uncompensated = "СД 2 типа НЕ компенсированный"
}
