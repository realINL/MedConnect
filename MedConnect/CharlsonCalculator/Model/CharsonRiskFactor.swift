//
//  CharsonRiskFactor.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import Foundation

struct CharsonRiskFactor: Hashable {
    let id: Int
    let title: String
    let poinrs: Int
}

extension CharsonRiskFactor {
    static let charlsonRiksFactors: [CharsonRiskFactor] = [
        CharsonRiskFactor(id: 1, title: "Инфаркт миокарда" , poinrs: 1),
        CharsonRiskFactor(id: 2, title: "Застойная сердечная недостаточность" , poinrs: 1),
        CharsonRiskFactor(id: 3, title: "Болезнь периферических артерий" , poinrs: 1),
        CharsonRiskFactor(id: 4, title: "Цереброваскулярное заболевание" , poinrs: 1),
        CharsonRiskFactor(id: 5, title: "Деменция" , poinrs: 1),
        CharsonRiskFactor(id: 6, title: "Хроническое заболевание легких" , poinrs: 1),
        CharsonRiskFactor(id: 7, title: "Болезнь соединительной ткани" , poinrs: 1),
        CharsonRiskFactor(id: 8, title: "Язвенная болезнь" , poinrs: 1),
        CharsonRiskFactor(id: 9, title: "Легкое поражение печени" , poinrs: 1),
        CharsonRiskFactor(id: 10, title: "СД без осложнений" , poinrs: 2),
        CharsonRiskFactor(id: 11, title: "СД с поражением органов" , poinrs: 2),
        CharsonRiskFactor(id: 12, title: "Гемиплегия" , poinrs: 2),
        CharsonRiskFactor(id: 13, title: "Умеренная или тяжелая болезнь почек" , poinrs: 2),
        CharsonRiskFactor(id: 14, title: "Диабет с поражением органов" , poinrs: 2),
        CharsonRiskFactor(id: 15, title: "Злокачественная опухоль без метастазов" , poinrs: 2),
        CharsonRiskFactor(id: 16, title: "Лейкемия" , poinrs: 2),
        CharsonRiskFactor(id: 17, title: "Лимфомы" , poinrs: 3),
        CharsonRiskFactor(id: 18, title: "Умеренное или тяжелое поражение печени" , poinrs: 3),
        CharsonRiskFactor(id: 19, title: "Метастазирующие злокачественные опухоли" , poinrs: 6),
        CharsonRiskFactor(id: 20, title: "СПИД (болезнь, а не только виремия)" , poinrs: 6)
    ]
}
