//
//  MedicalRecord.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import Foundation
 
struct MedicalRecord: Identifiable, Hashable, Codable {
    var id: String
    
    var patientId: String
    
    let age: Int
    var weight: Double
    var height: Int
    var bmi: Double { weight / Double(height * height) * 10000 }
    
    var asaIndex: Int = 0
    var ecogIndex: Int = 0
    var karnofskyIndex: Int = 0
    var capriniIndex: Int = 0
    var chrlsonIndex: Int = 0
    var weightLoss: Bool = false
    
    var disease: StomachCancer
    var concomitantDisease: ConcomitantDisease
    
    var chemotherapy: Chemotherapy
    var radiationTherapy: RadiationTherapy
    
    var postoperativeCourse: PostoperativeCourse
    var hospitalComplications: HospitalComplications
    var surgery: [Surgery]?
    var pathomorphology: Pathomorphology
}

extension MedicalRecord {
    static let MOCK_MedicalRecords: [MedicalRecord] = [MedicalRecord(id: "0",
                                                                    patientId: "3L6OnrNfrequ5aIbWQoy",
                                                                    age: 57,
                                                                    weight: 82,
                                                                    height: 178,
                                                                    asaIndex: 3,
                                                                    ecogIndex: 2,
                                                                    karnofskyIndex: 60,
                                                                    capriniIndex: 2,
                                                                    chrlsonIndex: 90,
                                                                    weightLoss: true,
                                                                     disease: StomachCancer.MOCK_StomachCancer.first!, concomitantDisease: ConcomitantDisease.MOCK_ConcomitantDisease,
                                                                    chemotherapy: Chemotherapy.MOCK_Chemotherapy[0],
                                                                    radiationTherapy: RadiationTherapy.MOCK_RadiationTherapy[0],
                                                                    postoperativeCourse: PostoperativeCourse.MOCK_PostoperativeCourse, hospitalComplications: HospitalComplications.MOCK_HospitalComplications,
                                                                    surgery: [Surgery.MOCK_Surgery],
                                                                    pathomorphology: Pathomorphology.MOCK_Pathomorphology),
                                                      MedicalRecord(id: "1",
                                                                    patientId: "1",
                                                                    age: 43,
                                                                    weight: 90,
                                                                    height: 191,
                                                                    asaIndex: 2,
                                                                    ecogIndex: 3,
                                                                    karnofskyIndex: 50,
                                                                    capriniIndex: 3,
                                                                    chrlsonIndex: 77,
                                                                    weightLoss: false,
                                                                    disease: StomachCancer.MOCK_StomachCancer.first!, concomitantDisease: ConcomitantDisease.MOCK_ConcomitantDisease,
                                                                    chemotherapy: Chemotherapy.MOCK_Chemotherapy[1],
                                                                    radiationTherapy: RadiationTherapy.MOCK_RadiationTherapy[1],
                                                                    postoperativeCourse: PostoperativeCourse.MOCK_PostoperativeCourse,
                                                                    hospitalComplications: HospitalComplications.MOCK_HospitalComplications, pathomorphology: Pathomorphology.MOCK_Pathomorphology),
                                                      MedicalRecord(id: "2",
                                                                    patientId: "2",
                                                                    age: 72,
                                                                    weight: 66,
                                                                    height: 163,
                                                                    asaIndex: 3,
                                                                    ecogIndex: 1,
                                                                    karnofskyIndex: 40,
                                                                    capriniIndex: 3,
                                                                    chrlsonIndex: 77,
                                                                    weightLoss: false,
                                                                    disease: StomachCancer.MOCK_StomachCancer.first!, concomitantDisease: ConcomitantDisease.MOCK_ConcomitantDisease,
                                                                    chemotherapy: Chemotherapy.MOCK_Chemotherapy[2],
                                                                    radiationTherapy: RadiationTherapy.MOCK_RadiationTherapy[2],
                                                                    postoperativeCourse: PostoperativeCourse.MOCK_PostoperativeCourse,
                                                                    hospitalComplications: HospitalComplications.MOCK_HospitalComplications, pathomorphology: Pathomorphology.MOCK_Pathomorphology)]
}
