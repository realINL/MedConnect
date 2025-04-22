//
//  RiskFactor.swift
//  MedConnect
//
//  Created by Илья Лебедев on 22.04.2025.
//

import Foundation

struct RiskFactor: Hashable {
    let id: Int
    let title: String
    let points: Int
}

extension RiskFactor {
    static let organismStateRiskFactors: [RiskFactor] = [
        RiskFactor(id: 1, title: "Отеки нижних конечностей (в данный момент)", points: 1),
        RiskFactor(id: 2, title: "Варикозные вены", points: 1),
        RiskFactor(id: 3, title: "Ожирение (индекс массы тела > 25 кг/м2)", points: 1),
        RiskFactor(id: 4, title: "Сепсис (<1 месяца)", points: 1),
        RiskFactor(id: 5, title: "Тяжелое заболевание легких (в т.ч. пневмония < 1 месяца)", points: 1),
        RiskFactor(id: 6, title: "Прием оральных контрацептивов, гормонозаместительная терапия", points: 1),
        RiskFactor(id: 7, title: "Беременность или послеродовый период (< 1 мес)", points: 1),
        RiskFactor(id: 8, title: "В анамнезе: необъяснимые мертворождения, повторный самопроизвольный аборт (3 и более раза), рождение ребёнка токсинемией, ребеёок с задержкой роста", points: 1),
        RiskFactor(id: 9, title: "Острый инфаркт миокарда", points: 1),
        RiskFactor(id: 10, title: "Хроническая сердечная недостаточность (сейчас или < 1 месяца)", points: 1),
        RiskFactor(id: 11, title: "Пациент находится на постельном режиме", points: 1),
        RiskFactor(id: 12, title: "Постельный режим более 72 часов", points: 2),
        RiskFactor(id: 13, title: "Воспалительное заболевание толсткой кишки в анамнезе", points: 1),
        RiskFactor(id: 14, title: "Большая хирургия в анамнезе (< 1 месяца)", points: 2),
        RiskFactor(id: 15, title: "Нарушение функции легких (ХОБЛ)", points: 1),
        RiskFactor(id: 16, title: "Злокачественное новообразование (в настоящее время или ранее)", points: 2),
        RiskFactor(id: 17, title: "Иммобилизация конечности (< 1 месяца)", points: 2),
        RiskFactor(id: 18, title: "Личный анамнез ВТЭО (ТГВ/ТЭЛА)", points: 3),
        RiskFactor(id: 19, title: "Мутация фактора V (Лейден)", points: 3),
        RiskFactor(id: 20, title: "Мутация протромбина 20210А", points: 3),
        RiskFactor(id: 21, title: "Семейный анамнез ВТЭО", points: 3),
        RiskFactor(id: 22, title: "Гипергомоцистеинемия", points: 3),
        RiskFactor(id: 23, title: "Гепарин-индуцированная тромбоцитопения", points: 3),
        RiskFactor(id: 24, title: "Повышенный уровень антител к кардиолипину", points: 3),
        RiskFactor(id: 25, title: "Другая наследственная или приобретенная тромбофилия", points: 3),
        RiskFactor(id: 26, title: "Инсульт (< 1 месяца)", points: 5),
        RiskFactor(id: 27, title: "Повреждение спинного мозга с параличом (< 1 месяца)", points: 5),
        RiskFactor(id: 28, title: "Какой-либо дополнительный фактор риска", points: 1)
    ]
    
    static let traumaRiskFactors: [RiskFactor] = [
        RiskFactor(id: 29, title: "Катетеризация центральных вен", points: 2),
        RiskFactor(id: 30, title: "Малое хирургическое вмешательство", points: 1),
        RiskFactor(id: 31, title: "Артроскопическая операция", points: 2),
        RiskFactor(id: 32, title: "Лапароскопическая операция (> 60 мин)", points: 2),
        RiskFactor(id: 33, title: "Большое хирургическое вмешательство (> 45 мин)", points: 2),
        RiskFactor(id: 34, title: "Множественные травмы (< 1 месяца)", points: 5),
        RiskFactor(id: 35, title: "Эндопротезирование крупных суставов", points: 5),
        RiskFactor(id: 36, title: "Перелом костей конечности или таза", points: 5)
    ]
}
