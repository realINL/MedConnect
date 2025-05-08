//
//  HospitalComplications.swift
//  MedConnect
//
//  Created by Илья Лебедев on 09.05.2025.
//

import Foundation

protocol Complication: Identifiable, Codable, Hashable {
    var complicationType: ComplicationType { get set }
    var onsetTime: String { get set }
    var cavienDindoGrade: CavienDindoGrade { get set }
    var outcome: ComplicationOutcome { get set }
}

struct GenerealComplication: Complication {
    let id: String
    var complicationType = ComplicationType.general
    var complication: GeneralComplicationType
    var onsetTime: String
    var cavienDindoGrade: CavienDindoGrade
    var outcome: ComplicationOutcome
}

extension GenerealComplication {
    static let MOCK_GenerealComplication: GenerealComplication = GenerealComplication(id: "1", complication: .cauti,
                                                                                      onsetTime: "2 дня",
                                                                                      cavienDindoGrade: .gradeI,
                                                                                      outcome: .fullRecovery)
    static let MOCK_GenerealComplications: [GenerealComplication] = [
        MOCK_GenerealComplication,
        GenerealComplication(id: "1",
                             complication: .arrhythmiaInvasive,
                             onsetTime: "1 час",
                             cavienDindoGrade: .gradeIIIa,
                             outcome: .fullRecovery),
        GenerealComplication(id: "2",
                             complication: .liverFailure,
                             onsetTime: "1 неделя",
                             cavienDindoGrade: .gradeII,
                             outcome: .fullRecovery),
        
    ]
}

struct SurgicalComplication: Complication {
    let id: String

    var complicationType = ComplicationType.surgical
    var complication: SurgicalComplicationType
    var onsetTime: String
    var cavienDindoGrade: CavienDindoGrade
    var outcome: ComplicationOutcome
    
}

extension SurgicalComplication {
    static let MOCK_SurgicalComplication: SurgicalComplication = SurgicalComplication(id: "1",
                                                                                      complication: .bleeding,
                                                                                      onsetTime: "1 час",
                                                                                      cavienDindoGrade: .gradeI,
                                                                                      outcome: .fullRecovery)
    
    static let MOCK_SurgicalComplications: [SurgicalComplication] = [MOCK_SurgicalComplication,
                                                                     SurgicalComplication(id: "2",
                                                                                          complication: .deepSSI,
                                                                                          onsetTime: "2 часа",
                                                                                          cavienDindoGrade: .gradeII,
                                                                                          outcome: .fullRecovery)]
}

struct HospitalComplications: Identifiable, Codable, Hashable {
    let id: String
    var hasComplications: YesNo
    var generalComplications: [GenerealComplication]?
    var SurgicalComplications: [SurgicalComplication]?
    
//    struct Complication: Codable, Identifiable {
//        let id = UUID()
//        var type: ComplicationType
//        var details: ComplicationDetails
//        var onsetTime: String // Сроки наступления
//        var classification: CavienDindoGrade
//        var outcome: ComplicationOutcome
//        
//        enum ComplicationType: String, Codable, CaseIterable {
//            case general = "Общее"
//            case surgical = "Хирургическое"
//        }
//        
//        struct ComplicationDetails: Codable {
//            // Общие осложнения
//            var generalType: GeneralComplicationType?
//            var otherGeneralDescription: String?
//            
//            // Хирургические осложнения
//            var surgicalType: SurgicalComplicationType?
//            var surgicalSubtype: SurgicalSubtype?
//            var treatmentApproach: [SurgicalTreatmentApproach]?
//            var otherSurgicalDescription: String?
//            
//            
//            
//            enum SurgicalComplicationType: String, Codable, CaseIterable {
//                case superficialSSI = "Поверхностные инфекционные осложнения раны"
//                case deepSSI = "Глубокие инфекционные осложнения раны"
//                case esophagealAnastomosis = "Несостоятельность пищеводного анастомоза"
//                case nonEsophagealAnastomosis = "Несостоятельность непищеводного анастомоза"
//                case bleeding = "Послеоперационное кровотечение"
//                case ileus = "Послеоперационная кишечная непроходимость"
//                case pancreaticFistula = "Послеоперационный панкреатический свищ"
//                case duodenalStump = "Несостоятельность культи двенадцатиперстной кишки"
//                case gastroparesis = "Гастростаз"
//                case perforation = "Послеоперационная перфорация или некроз кишечника"
//                case hernia = "Грыжа"
//                case eventration = "Эвентрация"
//                case other = "Другое"
//            }
//            
//            struct SurgicalSubtype: Codable {
//                // Для пищеводного анастомоза
//                var esophagealTiming: EsophagealTiming?
//                var esophagealType: EsophagealType?
//                
//                // Для панкреатического свища
//                var pancreaticFistulaType: PancreaticFistulaType?
//                
//                // Для культи ДПК
//                var duodenalTiming: DuodenalTiming?
//                var defectSize: DefectSize?
//                var bileLoss: BileLossVolume?
//                
//                enum EsophagealTiming: String, Codable {
//                    case early = "Ранняя (до 72 часов)"
//                    case late = "Поздняя (более 72 часов)"
//                }
//                
//                enum EsophagealType: String, Codable {
//                    case type1 = "Тип I"
//                    case type2 = "Тип II"
//                    case type3 = "Тип III"
//                }
//                
//                enum PancreaticFistulaType: String, Codable {
//                    case typeA = "Тип A"
//                    case typeB = "Тип B"
//                    case typeC = "Тип C"
//                }
//                
//                enum DuodenalTiming: String, Codable {
//                    case early = "Ранняя (до 72 часов)"
//                    case late = "Поздняя (более 72 часов)"
//                }
//                
//                enum DefectSize: String, Codable {
//                    case small = "До 2 см"
//                    case medium = "От 2 до 4 см"
//                    case large = "Более 4 см"
//                }
//                
//                enum BileLossVolume: String, Codable {
//                    case low = "Низкие (до 200 мл)"
//                    case moderate = "Умеренные (от 200 до 500 мл)"
//                    case high = "Высокие (более 500 мл)"
//                }
//            }
//            
//            enum SurgicalTreatmentApproach: String, Codable, CaseIterable {
//                case conservative = "Консервативная терапия"
//                case feedingTube = "Питательный зонд"
//                case drainage = "Дренирование под УЗИ"
//                case stenting = "Стентирование"
//                case vac = "ВАК-терапия"
//                case surgery = "Операция"
//                case thoracoscopic = "Торакоскопическая санация"
//                case jejunostomy = "Еюностомия"
//                case clipping = "Эндоскопическое клипирование"
//                case fistula = "Операция (наружный свищ)"
//                case biliaryDrainage = "Наружное желчное отведение"
//                case other = "Другая тактика"
//            }
//        }
//        
//        
//    }
    
    var reoperationsCount: Int?
    var hospitalizationOutcome: HospitalizationOutcome
    var dischargeDay: Int?
    
}

extension HospitalComplications {
    static let MOCK_HospitalComplications: HospitalComplications = HospitalComplications(id: "1", hasComplications: .yes,
                                                                                         generalComplications: GenerealComplication.MOCK_GenerealComplications,
                                                                                         SurgicalComplications: SurgicalComplication.MOCK_SurgicalComplications,
                                                                                         reoperationsCount: 0,
                                                                                         hospitalizationOutcome: .discharged)
}

enum HospitalizationOutcome: String, Codable {
    case discharged = "Выписан"
    case transferred = "Перевод в другой стационар"
    case death = "Смерть"
}

enum CavienDindoGrade: String, Codable, CaseIterable {
    case gradeI = "Grade I"
    case gradeII = "Grade II"
    case gradeIIIa = "Grade IIIa"
    case gradeIIIb = "Grade IIIb"
    case gradeIVa = "Grade IVa"
    case gradeIVb = "Grade IVb"
    case gradeV = "Grade V"
}

enum ComplicationOutcome: String, Codable, CaseIterable {
    case fullRecovery = "Полное выздоровление"
    case partialRecovery = "Частичное выздоровление"
    case death = "Смерть"
}

enum GeneralComplicationType: String, Codable, CaseIterable {
    case vap = "Пневмония, связанная с ИВЛ"
    case clabsi = "Инфекции кровотока"
    case cauti = "Инфекции мочевыводящих путей"
    case pleuralEffusion = "Плевральный выпот"
    case respiratoryFailure = "Дыхательная недостаточность"
    case renalFailure = "Острая почечная недостаточность"
    case prolongedIntubation = "Длительная интубация"
    case tracheostomy = "Трахеостомия"
    case cpr = "Сердечно-легочная реанимация"
    case pe = "ТЭЛА"
    case pneumothorax = "Пневмоторакс"
    case mi = "Острый инфаркт миокарда"
    case pulmonaryEdema = "Отек легких"
    case arrhythmiaNonInvasive = "Нарушения ритма (неинвазивное)"
    case arrhythmiaInvasive = "Нарушения ритма (инвазивное)"
    case stroke = "Нарушение мозгового кровообращения"
    case liverFailure = "Острая печеночная недостаточность"
    case other = "Другое"
}

enum SurgicalComplicationType: String, Codable, CaseIterable {
    case superficialSSI = "Поверхностные инфекционные осложнения раны Superficial SSI"
    case deepSSI = "Глубокие инфекционные осложнения раны deep SSI"
    case esophagealAnastomosis = "Несостоятельность пищеводного анастомоза"
    case nonEsophagealAnastomosis = "Несостоятельность непищеводного анастомоза"
    case bleeding = "Послеоперационное кровотечение"
    case ileus = "Послеоперационная кишечная непроходимость"
    case pancreaticFistula = "Послеоперационный панкреатический свищ"
    case duodenalStump = "Несостоятельность культи двенадцатиперстной кишки"
    case gastroparesis = "Гастростаз"
    case perforation = "Послеоперационная перфорация или некроз кишечника"
    case hernia = "Грыжа"
    case eventration = "Эвентрация"
    case other = "Другое"
}

enum ComplicationType: String, Codable, CaseIterable {
    case general = "Общее"
    case surgical = "Хирургическое"
}
