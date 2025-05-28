//
//  PostoperativeCourse.swift
//  MedConnect
//
//  Created by Илья Лебедев on 08.05.2025.
//

import Foundation

struct PostoperativeCourse: Identifiable, Hashable, Codable {
    
    let id: String

    var extubationOnTable: YesNo                    // Экстубация на столе
    var icitDays: Int                            // Койко-дни в ОРИТ
    var nutritionResumption: NutritionResumption    // Возобновление питания
    var antibioticTherapy: AntibioticTherapy       // Антибактериальная терапия
    var drainRemoval: DrainRemoval                 // Срок удаления дренажей
    
    // Возобновление питания
    struct NutritionResumption: Identifiable, Hashable, Codable {
        let id: String
        var sippingDay: Int?       // Сиппинг (сутки)
        var drinkingDay: Int?      // Питье (сутки)
        var eatingDay: Int?        // Еда (сутки)
    }
    
    // Антибактериальная терапия
    struct AntibioticTherapy: Identifiable, Hashable, Codable {
        let id: String
        var medication: String      // Лекарство
        var dosage: Int          // Дозировка, мг
        var duration: Int        // Длительность
    }
    
    // Срок удаления дренажей
    struct DrainRemoval: Identifiable, Hashable, Codable {
        let id: String
        var drain1Day: Int?       // Дренаж 1
        var drain2Day: Int?       // Дренаж 2
        var drain3Day: Int?       // Дренаж 3
    }
}

extension PostoperativeCourse {
    static let MOCK_PostoperativeCourse =  PostoperativeCourse(
        id: "1",
        extubationOnTable: .no,
        icitDays: 5,
        nutritionResumption: PostoperativeCourse.NutritionResumption(
            id: "1",
            sippingDay: 1,
            drinkingDay: 2,
            eatingDay: 3
        ),
        antibioticTherapy: PostoperativeCourse.AntibioticTherapy(
            id: "1",
            medication: "Амоксиклав",
            dosage: 500,
            duration: 7
        ),
        drainRemoval: PostoperativeCourse.DrainRemoval(
            id: "1",
            drain1Day: 2,
            drain2Day: 3,
            drain3Day: 4
        )
    )
}
