//
//  ValveDefects.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

enum ValveDefects: String, Codable, Hashable, CaseIterable {
    case none = "Нет"
    case moderateSevereAorticStenosis = "Умеренный или тяжелый аортальный стеноз"
    case severeValveRegurgitation = "Тяжелая недостаточность клапанов (любых)"
    case other = "Другие стенозы клапанов"
}
