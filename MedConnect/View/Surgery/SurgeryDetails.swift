//
//  SurgeryDetails.swift
//  MedConnect
//
//  Created by Илья Лебедев on 10.05.2025.
//

import SwiftUI

struct SurgeryDetails: View {
    @State var showDetails: Bool = true
    let surgery: Surgery
    var body: some View {
        CardView(title: "Surgery Details", showDetails: $showDetails) {
            LabeledValueRow(value: surgery.date.date, label: "Дата операции")
            LabeledValueRow(value: surgery.preoperativeBedDays.daysCount,
                            label: "Предоперационные койко-дни")
            LabeledValueRow(value: surgery.access,
                            label: "Доступ")
            Text("Объем операции")
                .secondaryTitleStyle()
            Text(surgery.surgeryVolume.mainProcedure.rawValue)
            if let procedureType = surgery.surgeryVolume.procedureType {
                Text(procedureType)
            }
            if let procrdureModification = surgery.surgeryVolume.procrdureModification {
                    Text(procrdureModification)
                }
            if let anastomosisType = surgery.surgeryVolume.anastomosisType {
                        Text(anastomosisType)
                    }
            Text(surgery.surgeryVolume.technique.rawValue)
            
            Divider()
            
            LabeledValueRow(value: surgery.esophagealResection.rawValue, label: "Резекция пищевода")
            
            LabeledValueRow(value: surgery.combinedSugrery.rawValue,
                            label: "Комбинированная операция")
//
//            Объем лимфаденэктомии
            LabeledValueRow(value: surgery.lymphadenectomy.rawValue, label: "Объем лимфаденэктомии")
//
//            Еюностомия
            LabeledValueRow(value: surgery.jejunostomy.description, label: "Еюностомия")
            
//            Интраоперационная ХТ
            LabeledValueRow(value: surgery.intraoperativeChemotherapy.rawValue, label: " Интраоперационная ХТ")
//
//            Продолжительность операции в минутах
            LabeledValueRow(value: surgery.operationDuration.minutesCount, label: "Продолжительность операции")
            
//            Объем интраоперационной кровопотери в мл
            LabeledValueRow(value: surgery.intraoperativeBloodLossMl.ml, label: " Объем интраоперационной кровопотери")
            
//            Количество дренажей
            LabeledValueRow(value: surgery.drainCount.description, label: " Количество дренажей")
            
//            Наличие назогастрального/еюнального зонда
            LabeledValueRow(value: surgery.feedingTube.rawValue, label: "Наличие назогастрального/еюнального зонда")
            
//            Интраоперационные осложнения
            LabeledValueRow(value: surgery.intraoperativeComplication, label: " Интраоперационные осложнения")

            
        }
    }
}

#Preview {
    SurgeryDetails(surgery: Surgery.MOCK_Surgery)
}
