//
//  TumorLocalization.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import Foundation

struct TumorLocalization: Codable, Hashable {
    var siewert: Siewert
    var bottom: String
    var tumorBody: TumorBody
    var pyloric: String
}
