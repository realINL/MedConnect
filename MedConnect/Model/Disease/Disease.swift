//
//  Disease.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import Foundation

protocol Disease: Identifiable, Hashable, Codable {
    var id: String { get }
    
    var type: DiseaseType { get set }
}
