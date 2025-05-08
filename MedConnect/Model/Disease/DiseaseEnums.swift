//
//  DiseaseEnums.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import Foundation

enum Histology: String, Codable, CaseIterable {
    case adenocarcinoma = "Аденокарцинома"
    case glandularSquamousCellCarcinoma = "Железисто-плоскоклеточный рак"
    case squamousCellCarcinoma = "Плоскоклеточный рак"
    case undifferentiatedCancer = "Недифференцированный рак"
    case unclassifiableCancer = "Неклассифицируемый рак"
}


enum TumorDifferentiation: String, Codable, CaseIterable {
    case gx = "GX \n(степень дифференцировки не может быть оценена)"
    case g1 = "G1 \n(высокодифференцированный рак)"
    case g2 = "G2 \n(умеренно дифференцированный рак)"
    case g3 = "G3 \n(низкодифференцированный, недифференцированный рак)"
    
    var shortCode: String {
        let components = self.rawValue.components(separatedBy: " ")
        return components.first ?? ""
    }
}

enum Siewert: String, Codable, CaseIterable {
    case I = "Siewert I (центр опухоли расположен в пределах от 1 до 5 см выше Z-линии)"
    case II = "Siewert II (центр опухоли расположен в пределах 1 см выше и 2 см ниже от Z-линии)"
    case III = "Siewert III (центр опухоли расположен в пределах от 2 до 5 см от Z-линии)"
    
    var shortCode: String {
        let components = self.rawValue.components(separatedBy: " ")
        let code = components.prefix(2).joined(separator: " ")
        return code
    }
}

//enum TumorLocalization: String, Codable {
//    case ker = ""
//    case bottom = "Дно"
//    case body = "bb"
//    case pyloric = "Пилорический отдел"
//}

enum TumorBody: String, Codable, CaseIterable {
    case proximal = "Проксимальная третья"
    case middle = "Средняя треть"
    case third = "Дистальная треть"
}

enum LaurenType:  String, Codable, CaseIterable {
    case diffuse = "Диффузный"
    case intestinal = "Кишечный"
    case mixed = "Смешанный"
    case unclassifiable = "Неклассифицируемый тип"
}

enum MainDiseaseConcomitant:  String, Codable, CaseIterable {
    case none = "Нет"
    case stenosisStenting = "Стеноз в анамнезе стентирование"
    case stenosisWithoutStenting = "Стеноз без стентирования"
    case bleeding = "Кровотечение"
    case perforation = "Перфорация"
}

enum CT:  String, Codable, CaseIterable {
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

enum CN:  String, Codable, CaseIterable {
    case n0 = "N0 (нет метастазов в регионарных лимфатических узлах)"
    case n1 = "N1 (поражение 1–2 регионарных лимфатических узлов)"
    case n2 = "N2 (поражение 3–6 регионарных лимфатических узлов)"
    case n3 = "N3 (поражение ≥ 7 регионарных лимфатических узлов)"
    case nx = "Nx (регионарные лимфатические узлы не могут быть оценены)"
    
    var shortCode: String {
        return self.rawValue.firstWord
    }
}

enum CM:  String, Codable, CaseIterable {
    case m0 = "M0 (отдаленные метастазы отсутствуют)"
    case m1 = "M1 (наличие отдаленных метастазов или наличие опухолевых клеток в смывах / биоптатах с брюшины)"
    case mx = "Мх (нет данных о наличии отдаленных метастазов)"
    
    var shortCode: String {
        return self.rawValue.firstWord
    }
}

enum ClinicalStage: String, Codable, CaseIterable {
    case zero = "0"
    case first = "I"
    case firstA = "IA"
    case firstB = "IB"
    case secondA = "IIA"
    case secondB = "IIB"
    case third = "III"
    case thirdA = "IIIA"
    case thirdB = "IIIB"
    case thirdC = "IIIC"
    case fourth = "IV"
    case fourthA = "IVA"
    case fourthB = "IVB"
    case undefined = "не определена"
}

