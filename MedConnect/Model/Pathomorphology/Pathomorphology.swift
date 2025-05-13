//
//  Pathomorphology.swift
//  MedConnect
//
//  Created by Илья Лебедев on 11.05.2025.
//

import Foundation

struct Pathomorphology: Codable, Identifiable, Hashable {
    let id: String
    var tumorHistology: TumorHistology
    var tumorHistologyDifferentiation: TumorHistologyDifferentiation
    var mandard: MandardTRG
    var lavnikova: LavnikovaGrade
    var becker: BeckerTRG
    var pTNM: PTNM
    var resectionBoundaries: ResectionBoundaries
    var removedLymphNodesCount: Int
    var removedPositiveLymphNodesCount: Int
    var adjuvantChemotherapy: AdjuvantChemotherapy
}

extension Pathomorphology {
    static let MOCK_Pathomorphology: Pathomorphology = Pathomorphology(id: "1",
                                                                       tumorHistology: TumorHistology.adenosquamousCarcinoma,
                                                                       tumorHistologyDifferentiation: TumorHistologyDifferentiation.g2,
                                                                       mandard: .trg1,
                                                                       lavnikova: .grade2,
                                                                       becker: .trg1b,
                                                                       pTNM: .init(pt: .t0, cn: .n0, cm: .m0),
                                                                       resectionBoundaries: .r1, removedLymphNodesCount: 1,
                                                                       removedPositiveLymphNodesCount: 0,
                                                                       adjuvantChemotherapy: AdjuvantChemotherapy(id: "1",
                                                                                                                  status: ChemotherapyStatus.completed,
                                                                                                                  scheme: ChemotherapyScheme.FLOT.rawValue,
                                                                                                                  startDate: Date.fromString("12.01.2025"),
                                                                                                                  endDate: Date.fromString("12.02,2025"))
    )
}

enum TumorHistology: String, Codable, Hashable, CaseIterable {
    case adenocarcinoma = "Аденокарцинома"
    case adenosquamousCarcinoma = "Аденосквамозная карцинома"
    case carcinomaWithLymphoidStroma = "Карцинома с лимфоидной стромой"
    case hepatoidAdenocarcinoma = "Гепатоидная аденокарцинома"
    case squamousCellCarcinoma = "Плоскоклеточная карцинома"
    case other = "Другая"
}

enum TumorHistologyDifferentiation: String, Codable, Hashable, CaseIterable {
    case g1 = "G1 - высокодифференцированная"
    case g2 = "G2 - умеренно дифференцированная"
    case g3 = "G3 - низкодифференцированная"
    
    var shortCode: String {
        return self.rawValue.firstWord
    }
}


enum MandardTRG: String, Codable, Hashable, CaseIterable {
    case trg1 = "TRG 1 - отсутствие жизнеспособных клеток опухоли"
    case trg2 = "TRG 2 - наличие рассеянных среди участков фиброза и 'озер' слизи единичных комплексов клеток рака"
    case trg3 = "TRG 3 - наличие жизнеспособной опухоли с преобладанием фиброза над опухолью"
    case trg4 = "TRG 4 - наличие жизнеспособной опухоли с преобладанием опухоли над фиброзом"
    case trg5 = "TRG 5 - опухоль без признаков регрессии"
    
    var shortCode: String {
        return self.rawValue.nFirstWords(2)
    }
}

enum LavnikovaGrade: String, Codable, Hashable, CaseIterable {
    case grade1 = "I степень - более 50% опухолевой паренхимы сохранено"
    case grade2 = "II степень - сохранено 20–50% опухолевой паренхимы"
    case grade3 = "III степень - до 20% паренхимы опухоли сохранилось в виде отдельных очагов"
    case grade4 = "IV степень - полное отсутствие опухолевой паренхимы"
    
    var shortCode: String {
        return self.rawValue.nFirstWords(2)
    }
}

enum BeckerTRG: String, Codable, Hashable, CaseIterable {
    case trg1a = "TRG1a - Отсутствие остаточной инвазивной опухоли"
    case trg1b = "TRG1b - Наличие менее 10% остаточной инвазивной опухоли"
    case trg2 = "TRG2 - Наличие 10 - 50% остаточной инвазивной опухоли"
    case trg3 = "TRG3 - Наличие более 50% остаточной инвазивной опухоли"
    
    var shortCode: String {
        return self.rawValue.firstWord
    }
}

struct PTNM: Codable, Hashable {
    var pt: PT
    var cn: PN
    var cm: PM
    
    var ptnm: String { return pt.shortCode + cn.shortCode + cm.shortCode  }
    
    var stage: String { calculateStage(pt: pt, cn: cn, cm: cm).rawValue }
    
    func calculateStage(pt: PT, cn: PN, cm: PM) -> ClinicalStage {
        switch (pt, cn, cm) {
        case (.tis,.n0, .m0):
            return .zero
            
        case (_, _, .m1):
            return .fourth
        
        case (.t1, .n0, .m0):
            return .firstA
            
        case (.t1, .n1, .m0),
             (.t2, .n0, .m0):
            return .firstA
        
        case (.t1, .n2, .m0),
             (.t2, .n1, .m0),
             (.t3, .n0, .m0):
            return .secondA
            
        case (.t1, .n3a, .m0),
             (.t2, .n2, .m0),
             (.t3, .n1, .m0),
             (.t4a, .n0, .m0):
            return .secondB
            
        case (.t2, .n3a, .m0),
             (.t3, .n2, .m0),
             (.t4a, .n1, .m0),
             (.t4a, .n2, .m0),
             (.t4b, .n0, .m0):
            return .thirdA
            
        case (.t1, .n3b, .m0),
             (.t2, .n3b, .m0),
             (.t3, .n3a, .m0),
             (.t4a, .n3a, .m0),
             (.t4b, .n1, .m0),
             (.t4b, .n2, .m0):
            return .thirdB
            
        case (.t3, .n3b, .m0),
             (.t4a, .n3b, .m0),
             (.t4b, .n3a, .m0),
             (.t4b, .n3b, .m0):
            return .thirdC
            
        default:
            return .undefined
        }
    }
}

enum PT:  String, Codable, CaseIterable {
    case t0     = "T0 (данных о наличии первичной опухоли не выявлено)"
    case tis    = "Tis (карцинома in situ (опухоль в пределах слизистой оболочки без инвазии собственной пластинки) / тяжелая дисплазия)"
    case t1     = "T1 (опухоль захватывает собственную пластинку или мышечную пластинку слизистой оболочки, подслизистый слой)"
    case t2     = "T2 (опухоль захватывает мышечный слой)"
    case t3     = "T3 (опухоль захватывает субсерозу без инвазии в висцеральную брюшину или прилежащие структуры; к опухолям этой группы относятся также опухоли с инвазией желудочно-ободочной и желудочно-печеночной связки, большого и малого сальников без поражения висцеральной брюшины)"
    case t4a    = "T4a (опухоль захватывает серозную оболочку (висцеральная брюшина))"
    case t4b    = "T4b (опухоль захватывает соседние структуры, такие как селезенка, поперечная ободочная кишка, печень, диафрагма, поджелудочная железа, передняя брюшная стенка, надпочечник, почка, тонкая кишка, забрюшинное пространство)"
    case tx     = "Tx (первичная опухоль не может быть оценена)"
    
    var shortCode: String {
        return self.rawValue.firstWord
    }
}

enum PN:  String, Codable, CaseIterable {
    case n0 = "N0 (нет метастазов в регионарных лимфатических узлах)"
    case n1 = "N1 (поражение 1–2 регионарных лимфатических узлов)"
    case n2 = "N2 (поражение 3–6 регионарных лимфатических узлов)"
    case n3 = "N3 (поражение ≥ 7 регионарных лимфатических узлов)"
    case n3a = "N3a"
    case n3b = "N3b"
    
    var shortCode: String {
        return self.rawValue.firstWord
    }
}

enum PM:  String, Codable, CaseIterable {
    case m0 = "M0 (отдаленные метастазы отсутствуют)"
    case m1 = "M1 (наличие отдаленных метастазов или наличие опухолевых клеток в смывах / биоптатах с брюшины)"
    case mx = "Мх (нет данных о наличии отдаленных метастазов)"
    
    var shortCode: String {
        return self.rawValue.firstWord
    }
}

enum ResectionBoundaries: String, Codable, CaseIterable {
    case r0 = "R0"
    case r1 = "R1 (<1 mm)"
    case r2 = "R2"
}

struct AdjuvantChemotherapy: Codable, Identifiable, Hashable {
    let id: String
    var status: ChemotherapyStatus
    var scheme: String?
    var startDate: Date?
    var endDate: Date?
    var interruptionReasons: String?
}

