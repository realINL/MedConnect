//
//  StomachCancer.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import Foundation

struct StomachCancer: Disease {
    var id: String
    
    var type: DiseaseType = .stomachCancer
    
    
    var size: String // ?
    
    // границы ЭГДС
    
    var histology: Histology
    var tumorDifferentiation: TumorDifferentiation
    var tumorLocalization: TumorLocalization
    var lauren: LaurenType
    var mainDiseaseConcomitant: MainDiseaseConcomitant
    var cTNM: CTNM
    
    
}

extension StomachCancer {
    static let MOCK_StomachCancer: [StomachCancer] = [StomachCancer(id: "0", size: "5 х 5", histology: .glandularSquamousCellCarcinoma, tumorDifferentiation: .g1, tumorLocalization: TumorLocalization(siewert: .I, bottom: "", tumorBody: .middle, pyloric: ""), lauren: .diffuse, mainDiseaseConcomitant: .stenosisWithoutStenting, cTNM: CTNM(ct: .t1, cn: .n0, cm: .m0))
    ]
}
