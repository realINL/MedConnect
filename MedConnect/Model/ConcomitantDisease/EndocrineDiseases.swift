//
//  EndocrineDiseases.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

struct EndocrineDiseases: Codable, Hashable {
    var diabetes: Diabetes
    var hypothyroidism: YesNo
    var hyperparathyroidism: YesNo
    var otherEndocrineDiseases: String
}

extension EndocrineDiseases {
    static let MOCK_EndocrineDiseases: EndocrineDiseases = EndocrineDiseases(diabetes: .type1Uncompensated, hypothyroidism: .no, hyperparathyroidism: .no, otherEndocrineDiseases: "")
}
