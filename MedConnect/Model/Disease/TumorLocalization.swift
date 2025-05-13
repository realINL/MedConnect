//
//  TumorLocalization.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import Foundation

struct TumorLocalization: Codable, Hashable {
    var localization: TumorLocalizationCases
    var desription: String
}

enum TumorLocalizationCases: String, Codable, Hashable, CaseIterable {
    case ker = "КЭР"
    case bottom = "Дно"
    case tumorBody = "Тело"
    case pyloric = "Пилорический отдел"
}

