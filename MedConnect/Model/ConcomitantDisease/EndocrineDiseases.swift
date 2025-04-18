//
//  EndocrineDiseases.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

struct EndocrineDiseases: Codable, Hashable {
    var diabetes: Diabetes
    var hypothyroidism: Bool
    var hyperparathyroidism: Bool
    var otherEndocrineDiseases: String
}

extension EndocrineDiseases {
    static let MOCK_EndocrineDiseases: EndocrineDiseases = EndocrineDiseases(diabetes: .type1Uncompensated, hypothyroidism: false, hyperparathyroidism: false, otherEndocrineDiseases: "")
}
