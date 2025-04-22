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
    
    let patientId: Int // id пациента
    
    init(patientId: Int) {
        self.patientId = patientId
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
        
        return organismScore + traumaScore
    }
    
    func updatePatientCaprini() {
        
    }
}
