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
    var stage: String = ""
}
