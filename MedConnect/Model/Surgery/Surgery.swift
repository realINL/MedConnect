//
//  Surgery.swift
//  MedConnect
//
//  Created by Илья Лебедев on 10.05.2025.
//

import Foundation

struct Surgery: Identifiable, Codable, Hashable {
    var id: String
    let patientId: String?
    var patient: Patient?
    var date: Date // Дата проведения операции
    var preoperativeBedDays: Int // Количество предоперационных койко-дней
    var access: String // Доступ
    var surgeryVolume: SurgeryVolume // Объем операции
    var esophagealResection: EsophagealResection // Резекция пищевода
    var combinedSugrery: CombinedProcedure // Комбинированная операция
    var lymphadenectomy: Lymphadenectomy // Объем лимфаденэктомии
    var jejunostomy: Bool // Еюностомия
    var intraoperativeChemotherapy: IntraoperativeChemotherapy // Интраоперационная ХТ
    var operationDuration: Int // Продолжительность операции в минутах
    var intraoperativeBloodLossMl: Int // Объем интраоперационной кровопотери в мл
    var drainCount: Int // Количество дренажей
    var feedingTube: FeedingTube // Наличие назогастрального/еюнального зонда
    var intraoperativeComplication: String // Интраоперационные осложнения
    var lastChange: Date // Дата последнего изменения
    
    init() {
        self.id = NSUUID().description
        self.patientId = ""
        self.patient = nil
        self.date = Date.now
        self.preoperativeBedDays = 0
        self.access = SurgicalAccess.laparotomy.rawValue
        self.surgeryVolume = SurgeryVolume()
        self.esophagealResection = EsophagealResection.none
        self.combinedSugrery = CombinedProcedure.none
        self.lymphadenectomy = Lymphadenectomy.d0
        self.jejunostomy = false
        self.intraoperativeChemotherapy = IntraoperativeChemotherapy.none
        self.operationDuration = 60
        self.intraoperativeBloodLossMl = 0
        self.drainCount = 0
        self.feedingTube = FeedingTube.none
        self.intraoperativeComplication = IntraoperativeComplication.none.rawValue
        self.lastChange = Date.now
    }
    
    init(
        id: String,
        patientId: String?,
        patient: Patient?,
        date: Date,
        preoperativeBedDays: Int,
        access: String,
        surgeryVolume: SurgeryVolume,
        esophagealResection: EsophagealResection,
        combinedSugrery: CombinedProcedure,
        lymphadenectomy: Lymphadenectomy,
        jejunostomy: Bool,
        intraoperativeChemotherapy: IntraoperativeChemotherapy,
        operationDuration: Int,
        intraoperativeBloodLossMl: Int,
        drainCount: Int,
        feedingTube: FeedingTube,
        intraoperativeComplication: String
    ) {
        self.id = id
        self.patientId = patientId
        self.patient = patient
        self.date = date
        self.preoperativeBedDays = preoperativeBedDays
        self.access = access
        self.surgeryVolume = surgeryVolume
        self.esophagealResection = esophagealResection
        self.combinedSugrery = combinedSugrery
        self.lymphadenectomy = lymphadenectomy
        self.jejunostomy = jejunostomy
        self.intraoperativeChemotherapy = intraoperativeChemotherapy
        self.operationDuration = operationDuration
        self.intraoperativeBloodLossMl = intraoperativeBloodLossMl
        self.drainCount = drainCount
        self.feedingTube = feedingTube
        self.intraoperativeComplication = intraoperativeComplication
        self.lastChange = Date.now
    }
}

extension Surgery {
    static let MOCK_Surgery: Surgery = Surgery(id: "1",
                                               patientId: "1",
                                               patient: Patient.MOCK_Patients.first!,
                                               date: Date.fromString("10.01.2025")!,
                                               preoperativeBedDays: 4,
                                               access: SurgicalAccess.laparotomy.rawValue,
                                               surgeryVolume: SurgeryVolume(mainProcedure: .distalSubtotalGastricResection,
                                                                            procedureType: SurgeryProcedureType.bilrothII.rawValue,
                                                                            procrdureModification: SurgeryProcedureModification.rouxEnY.rawValue,
                                                                            anastomosisType: AnastomosisType.gastroenteroanastomosis.rawValue,
                                                                            technique: AnastomosisTechnique.linear),
                                               esophagealResection: .none,
                                               combinedSugrery: .diaphragmResection,
                                               lymphadenectomy: .d1,
                                               jejunostomy: false,
                                               intraoperativeChemotherapy: .none,
                                               operationDuration: 76,
                                               intraoperativeBloodLossMl: 78,
                                               drainCount: 1,
                                               feedingTube: .none,
                                               intraoperativeComplication: IntraoperativeComplication.none.rawValue)
    
    static let MOCK_Surgery_Draft: Surgery = Surgery(id: "2",
                                               patientId: "1",
                                               patient: Patient.MOCK_Patients.first!,
                                               date: Date.fromString("10.01.2025")!,
                                               preoperativeBedDays: 0,
                                               access: SurgicalAccess.laparotomy.rawValue,
                                               surgeryVolume: SurgeryVolume(mainProcedure: .distalSubtotalGastricResection,
                                                                            procedureType: SurgeryProcedureType.bilrothII.rawValue,
                                                                            procrdureModification: SurgeryProcedureModification.rouxEnY.rawValue,
                                                                            anastomosisType: AnastomosisType.gastroenteroanastomosis.rawValue,
                                                                            technique: AnastomosisTechnique.linear),
                                               esophagealResection: .none,
                                               combinedSugrery: .diaphragmResection,
                                               lymphadenectomy: .d1,
                                               jejunostomy: false,
                                               intraoperativeChemotherapy: .none,
                                               operationDuration: 60,
                                               intraoperativeBloodLossMl: 0,
                                               drainCount: 0,
                                               feedingTube: .none,
                                               intraoperativeComplication: IntraoperativeComplication.none.rawValue)
}

enum SurgicalAccess: String, CaseIterable, Codable {
    case laparotomy = "Лапаротомия"
    case laparoscopy = "Лапароскопия"
    case laparoscopyWithConversion = "Лапароскопия, конверсия"
    case robotic = "Робот"
    case roboticWithConversion = "Робот, конверсия"
    case osawaGarlock = "Osawa—Garlock"
    case separateAbdominalThoracic = "Раздельный абдоминальный и торакальный"
}

struct SurgeryVolume: Codable, Hashable {
    var mainProcedure: MainSurgeryProcedure
    var procedureType: String?
    var procrdureModification: String?
    var anastomosisType: String?
    var technique: AnastomosisTechnique
    
    init() {
        self.mainProcedure = MainSurgeryProcedure.gastrectomy
        self.procedureType = SurgeryProcedureType.rouxEnY.rawValue
        self.procrdureModification = nil
        self.anastomosisType = AnastomosisType.esophagoenteroanastomosis.rawValue
        self.technique = AnastomosisTechnique.manual
    }
    
    init(mainProcedure: MainSurgeryProcedure,
         procedureType: String?,
         procrdureModification: String?,
         anastomosisType: String?,
         technique: AnastomosisTechnique)
    {
        self.mainProcedure = mainProcedure
        self.procedureType = procedureType
        self.procrdureModification = procrdureModification
        self.anastomosisType = anastomosisType
        self.technique = technique
        
    }
}

enum MainSurgeryProcedure: String, Codable, CaseIterable {
    case proximalSubtotalGastrectomy = "Проксимальная субтотальная резекция желудка"
    case distalSubtotalGastricResection = "Дистальная субтотальная резекция желудка"
    case gastrectomy  = "Гастрэктомия"
    case esophagojejunoanastomosis = "Эзофагоеюноанастомоз"
    case atypicalFulllayerGastricResection = "Атипичная/Полнослойная резекция желудка"
    case transurethralResection = "Трансгастральная резекция"
    case pyloricpPreservingGastricResection = "Пилоросохраняющая резекция желудка"
    case other = "Другое"
}

enum SurgeryProcedureType: String, Codable, CaseIterable {
    case doubleTract = "Double tract"
    case doubleSingleFlap = "Double/single flap"
    case merendinoJejunalInterposition = "Merendino jejunal interposition"
    case bilrothI = "Bilroth I"
    case bilrothII = "Bilroth II"
    case rouxEnY = "Roux-en-Y"
    case uncutRouxEnY = "Uncut Roux-en-Y"
    case loopReconstruction = "Петлевая реконструкция"
    case standardJejunogastroplasty = "Еюногастропластика стандартная"
    case reservoirJejunogastroplasty = "Еюногастропластика резервуарная"
}
enum SurgeryProcedureModification: String, Codable, CaseIterable {
    case hofmeisterFinsterer = "Гофмейстера-Финстерера"
    case rouxEnY = "Roux-en-Y"
    case uncutRouxEnY = "uncut Roux-en-Y"
    case braunLoopAnastomosis = "Петлевой анастомоз по Брауну"
}
enum AnastomosisType: String, Codable, CaseIterable {
    case esophagojejunoanastomosis = "Эзофагоеюноанастомоз"
    case gastroenteroanastomosis = "Гастроэнтероанастомоз"
    case enterogastroanastomosis = "Энтерогастроанастомоз"
    case interintestinalAnastomosis = "Межкишечный анастомоз"
    case esophagoenteroanastomosis = "Эзофагоэнтероанастомоз"
    case enteroduedenoanastomosis = "Энтеродуоденоанастомоз"
}


enum AnastomosisTechnique: String, Codable, CaseIterable {
    case manual = "Ручной"
    case linear = "Аппаратный - линейный"
    case circular = "Аппаратный - циркулярный"
    case combined = "Комбинированный (аппаратный+ручной)"
}

// Резекция пищевода
enum EsophagealResection: String, Codable, CaseIterable {
    case none = "Нет"
    case upTo2cm = "До 2 см"
    case from2To4cm = "От 2 до 4 см"
    case moreThan4cm = "Более 4 см"
}

// Комбинированная операция (множественный выбор)
enum CombinedProcedure: String, Codable, CaseIterable {
    case none = "Нет"
    case splenectomy = "Спленэктомия"
    case pancreasResection = "Резекция ПЖ"
    case liverResection = "Резекция печени"
    case diaphragmResection = "Резекция диафрагмы"
    case smallIntestineResection = "Резекция тонкой кишки"
    case largeIntestineResection = "Резекция толстой кишки"
}

// Объем лимфаденэктомии
enum Lymphadenectomy: String, Codable, CaseIterable {
    case d0 = "D0"
    case d1 = "D1"
    case d1plus = "D1+"
    case d2 = "D2"
    case d2plus = "D2+"
}

// Интраоперационная химиотерапия
enum IntraoperativeChemotherapy: String, Codable, CaseIterable {
    case none = "Нет"
    case hipeg = "HIPEC"
    case pipac = "PIPAC"
    case other = "Другая"
}

// Наличие зонда
enum FeedingTube: String, Codable, CaseIterable {
    case none = "Нет"
    case present = "Да"
    case decompression = "Для декомпрессии"
    case nutrition = "Для питания"
}

// Интраоперационные осложнения
enum IntraoperativeComplication: String, Codable, CaseIterable {
    case none = "Нет"
    case bleeding = "Кровотечение"
    case organDamage = "Повреждение внутренних органов"
    case other = "Другое"
}
