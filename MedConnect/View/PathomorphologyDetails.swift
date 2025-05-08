//
//  PathomorphologyDetails.swift
//  MedConnect
//
//  Created by Илья Лебедев on 11.05.2025.
//

import SwiftUI

struct PathomorphologyDetails: View { // MARK: ПАТОМОРФОЛОГИЯ ПОСЛЕ ОПЕРАЦИИ
    @State var showDetails: Bool = true
    let pathomorphology: Pathomorphology?
    var body: some View {
        if let pathomorphology = pathomorphology {
            CardView(title: "Патоморфология", showDetails: $showDetails) {
                // MARK: Гистология опухоли (ВОЗ)
                Text("Гистология").secondaryTitleStyle()
                
                Text(pathomorphology.tumorHistology)
                if let differentiation = pathomorphology.tumorHistologyDifferentiation {
                    Text(differentiation)
                }
                
                // MARK: Лечебный патоморфоз
                Text("Лечебный патоморфоз").secondaryTitleStyle()
                
                LabeledValueRow(value:pathomorphology.mandard.shortCode,
                                label: "Mandrad")
                LabeledValueRow(value:pathomorphology.lavnikova.shortCode,
                                label: "Лавниковой")
                LabeledValueRow(value:pathomorphology.becker.shortCode,
                                label: "Becker")
                
                // MARK: Стадирование по pTNM
                Text("pTNM").secondaryTitleStyle()
                
                Text(pathomorphology.pTNM.ptnm)
                Text("Клиническая стадия \(pathomorphology.pTNM.stage)")
                
                // MARK: Лечебный патоморфоз
                Text("Границы резекции").secondaryTitleStyle()
                
                Text(pathomorphology.resectionBoundaries.rawValue)
                
                // MARK: Кол-во удаленных лимфатических узлов
                Text("Удаленные лимфатические узлы").secondaryTitleStyle()
                
                LabeledValueRow(value: pathomorphology.removedLymphNodesCount.description,
                                label: "Общее количество")
                LabeledValueRow(value: pathomorphology.removedPositiveLymphNodesCount.description,
                                label: "Положительные")
                
                // MARK: Адъювантная химиотерапия
                
                Text("Адъювантная химиотерапия").secondaryTitleStyle()
                
                LabeledValueRow(value: pathomorphology.adjuvantChemotherapy.status.description, label: "Статус")
                
                switch pathomorphology.adjuvantChemotherapy.status {
                case .none:
                    EmptyView()
                case .partially:
                    LabeledValueRow(value:  pathomorphology.adjuvantChemotherapy.scheme?.description ?? "",
                                    label: "Схема")
                    LabeledValueRow(value: "\(pathomorphology.adjuvantChemotherapy.startDate?.date ?? "")",
                                    label: "Начало терапии")
                    Text(pathomorphology.adjuvantChemotherapy.interruptionReasons ?? "")
                case .completed(_, _):
                    LabeledValueRow(value:  pathomorphology.adjuvantChemotherapy.scheme?.description ?? "",
                                    label: "Схема")
                    LabeledValueRow(value: "\(pathomorphology.adjuvantChemotherapy.startDate?.date ?? "") - \(pathomorphology.adjuvantChemotherapy.endDate?.date ?? "")",
                                    label: "Период терапии")
                    
                }
            }
        }
    }
}

#Preview {
    PathomorphologyDetails(pathomorphology: Pathomorphology.MOCK_Pathomorphology)
}
