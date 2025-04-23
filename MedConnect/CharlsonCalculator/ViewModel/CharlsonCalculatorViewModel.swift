//
//  CharlsonCalculatorViewModel.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import Foundation

class CharlsonCalculatorViewModel: ObservableObject {
    @Published var selections: [Int: Bool] = [:] // выбор факторов
    
    var totalScore: Int { // кол-во баллов
        calculateScore()
    }
    
    var survivalLevel: Int { // процент 10-летней выживаемости
        switch totalScore {
        case 0: return 99
        case 1: return 96
        case 2: return 90
        case 3: return 77
        case 4: return 53
        default: return 21
        }
    }
    
    let medicalRecord: MedicalRecord // медкарта пациента
    
    init(medicalRecord: MedicalRecord) {
        self.medicalRecord = medicalRecord
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
        
        return organismScore + traumaScore + calculateAgeScore(age: medicalRecord.age)
    }
    
    func calculateAgeScore(age: Int) -> Int { // баллы за возраст
        switch age {
        case 0...39: return 0
        default: return (age - 30) / 10
        }
    }
    
    func updatePatientCharlson() {
        
    }
}
