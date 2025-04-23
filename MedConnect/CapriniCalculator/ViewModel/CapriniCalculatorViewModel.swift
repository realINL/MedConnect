//
//  CapriniCalculatorView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.04.2025.
//

import Foundation

class CapriniCalculatorViewModel: ObservableObject {
    
    @Published var selections: [Int: Bool] = [:] // выбор факторов
    
    var totalScore: Int { // кол-во баллов
        calculateScore()
    }
    
    let patient: Patient // id пациента
    
    init(patient: Patient) {
        self.patient = patient
    }
    
    
    func resetSelections() { // очистить форму
        selections.removeAll()
    }
    
    func calculateScore() -> Int  { // посчитать кол-во баллов
        let organismScore: Int = RiskFactor.organismStateRiskFactors
            .filter { selections[$0.id] == true }
            .reduce(0) { $0 + $1.points }
        
        let traumaScore: Int = RiskFactor.traumaRiskFactors
            .filter { selections[$0.id] == true }
            .reduce(0) { $0 + $1.points }
        
        return organismScore + traumaScore + calculateAgeScore(age: patient.age)
    }
    
    func calculateAgeScore(age: Int) -> Int {
        switch age {
        case 0...40: return 0
        case 41...60: return 1
        case 61...74: return 2
        default: return 3
        }
    }
    
    func updatePatientCaprini() {
        
    }
}
