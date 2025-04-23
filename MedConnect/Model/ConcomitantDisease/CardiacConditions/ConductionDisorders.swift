//
//  ConductionDisorders.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

enum ConductionDisorders: String, Codable, Hashable {
    case none = "Нет"
    case saAvBlockWithoutPacemaker = "Любая СА/АВ блокада 2 и 3 степени БЕЗ имплантации ЭКС"
    case saAvBlockWithPacemaker = "Любая СА/АВ блокада 2 и 3 степени + имплантация ЭКС"
    case leftBundleBranchBlock = "ПБЛНПГ (блокада левой ножки пучка Гиса)"
//    case other
}
