//
//  EndocrineDiseases.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

struct EndocrineDiseases: Codable {
    var diabetes: Diabetes
    var hypothyroidism: Bool
    var hyperparathyroidism: Bool
    var otherEndocrineDiseases: String
}
