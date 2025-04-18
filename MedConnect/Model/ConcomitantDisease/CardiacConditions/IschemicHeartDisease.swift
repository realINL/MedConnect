//
//  IschemicHeartDisease.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

enum IschemicHeartDisease: String, Codable {
    case none = "Нет"
    case pixNoRevascularization = "ПИКС БЕЗ реваскуляризации"
    case pixWithRevascularization = "ПИКС, стентирование/шунтирование коронарных артерий в анамнезе"
    case anginaNoRevascularization = "Стенокардия напряжения БЕЗ реваскуляризации"
    case anginaWithRevascularization = "Стенокардия напряжения + стентирование/шунтирование коронарных артерий в анамнезе"
}
