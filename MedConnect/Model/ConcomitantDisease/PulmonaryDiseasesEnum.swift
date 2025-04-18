//
//  LungDiseasesEnum.swift
//  MedConnect
//
//  Created by Илья Лебедев on 18.04.2025.
//

import Foundation

enum PulmonaryDiseases: String, Codable, Hashable {
    case none = "Нет"
    case copd = "ХОБЛ"
    case bronchialAsthma = "Бронхиальная астма"
    case emphysema = "Эмфизема легких"
    case sarcoidosisOrFibrosis = "Саркоидоз или другие фиброзы"
}
