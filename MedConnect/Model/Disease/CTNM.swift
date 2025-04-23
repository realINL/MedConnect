//
//  CTNM.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import Foundation

struct CTNM: Codable, Hashable {
    var ct: CT
    var cn: CN
    var cm: CM
    
    var ctnm: String { return ct.shortCode + cn.shortCode + cm.shortCode  }
    
    var stage: String { calculateStage(ct: ct, cn: cn, cm: cm).rawValue }
    
    func calculateStage(ct: CT, cn: CN, cm: CM) -> ClinicalStage {
        switch (ct, cn, cm) {
        case (.tis,.n0, .m0):
            return .zero
        case (_, _, .m1):
            return .fourthB
        
        case (.t1, .n0, .m0), (.t2, .n0, .m0):
            return .first
            
        case (.t1, .n1, .m0),
             (.t1, .n2, .m0),
             (.t1, .n3, .m0),
             (.t2, .n1, .m0),
             (.t2, .n2, .m0),
             (.t2, .n3, .m0):
            return .secondA
            
        case (.t3, .n0, .m0),
             (.t4a, .n0, .m0):
            return .secondB
            
        case (.t3, .n1, .m0),
             (.t3, .n2, .m0),
             (.t3, .n3, .m0),
             (.t4a, .n1, .m0),
             (.t4a, .n2, .m0),
             (.t4a, .n3, .m0):
            return .third
            
        case (.t4b, _, .m0):
            return .fourthA
            
        default:
            return .undefined
        }
    }
}
