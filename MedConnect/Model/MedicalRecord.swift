//
//  MedicalRecord.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import Foundation
 
struct MedicalRecord: Identifiable, Hashable, Codable {
    let id: String
    
    let patientId: String
    
    let age: Int
    var weight: Double = 0.0
    var height: Int = 0
    
    var asaIndex: Int = 0
    var ecogIndex: Int = 0
    var karnofskyIndex: Int = 0
    var capriniIndex: Int = 0
    var chrlsonIndex: Int = 0
    var weightLoss: Bool = false
    
    var disease: StomachCancer
    
    var chemotherapy: Chemotherapy
    var radiationTherapy: RadiationTherapy
    
    
}

extension MedicalRecord {
    static let MOCK_MedicalRecord: [MedicalRecord] = [MedicalRecord(id: "0",
                                                                    patientId: "0",
                                                                    age: 57,
                                                                    disease: StomachCancer.MOCK_StomachCancer.first!,
                                                                    chemotherapy: Chemotherapy.MOCK_Chemotherapy[0],
                                                                    radiationTherapy: RadiationTherapy.MOCK_RadiationTherapy[0]),
                                                      MedicalRecord(id: "1",
                                                                    patientId: "1",
                                                                    age: 43,
                                                                    disease: StomachCancer.MOCK_StomachCancer.first!,
                                                                    chemotherapy: Chemotherapy.MOCK_Chemotherapy[1],
                                                                    radiationTherapy: RadiationTherapy.MOCK_RadiationTherapy[1]),
                                                      MedicalRecord(id: "2",
                                                                    patientId: "2",
                                                                    age: 40,
                                                                    disease: StomachCancer.MOCK_StomachCancer.first!,
                                                                    chemotherapy: Chemotherapy.MOCK_Chemotherapy[2],
                                                                    radiationTherapy: RadiationTherapy.MOCK_RadiationTherapy[2])]
}
