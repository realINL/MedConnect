//
//  AorticAneurysm.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

enum AorticAneurysm: String, Codable, Hashable {
    case none = "Нет"
    case chronicWithoutRepair = "Хроническая аневризма без пластики"
    case repaired = "Протезирование аневризмы в анамнезе"
}
