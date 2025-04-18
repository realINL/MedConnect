//
//  PeripheralAtherosclerosis.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

enum PeripheralAtherosclerosis: String, Codable, Hashable {
    case none = "Нет"
    case carotidStenosisOver70NoRevasc = "Стенозирование БЦА более 70% БЕЗ реваскуляризаци"
    case legArteryStenosisOver70NoRevasc = "Стенозирование артерий нижних конечностей более 70% БЕЗ реваскуляризации"
    case withRevascularization = "Атерослероз БЦА/артерий нижних конечностей + стентирование, эндартерэктомия или шунтирование в анамнезе"
}
