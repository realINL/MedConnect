//
//  Hypertension.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

enum Hypertension: String, Codable, Hashable, CaseIterable {
    case none = "Нет"
    case stage1 = "I стадия"
    case stage2 = "II стадия"
    case stage3 = "III стадия"
}
