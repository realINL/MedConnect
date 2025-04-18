//
//  HeartFailure.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

enum HeartFailure: String, Codable {
    case none = "Нет"
    case lvefBelow40 = "Фракция выброса ЛЖ менее 40%"
    case lvef41to49 = "Фракция выброса ЛЖ (41-49%)"
    case lvef50andAbove = "Фракция выброса ЛЖ более 50%"
}
