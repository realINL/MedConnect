//
//  PatientCT.swift
//  MedConnect
//
//  Created by Илья Лебедев on 19.04.2025.
//

import SwiftUI

struct PatientCT: View {
    @State var showDetails: Bool = true
    let medicalRecord: MedicalRecord
    let chemo: Chemotherapy
    
    init(medicalRecord: MedicalRecord) {
        self.medicalRecord = medicalRecord
        self.chemo = medicalRecord.chemotherapy
    }
    
    var body: some View {
        CardView(title: "Химиотерапия", showDetails: $showDetails) {
            
            VStack {
                LabeledValueRow(value: chemo.status.rawValue,
                                label: "Статус")
                switch chemo.status {
                case .none:
                    EmptyView()
                case .partially:
                    LabeledValueRow(value: chemo.scheme?.description ?? "no data",
                                    label: "Схема")
                    Divider()
                    LabeledValueRow(value: "\(chemo.numberOfCourses)",
                                    label: "Кол-во курсов")
                    Divider()
                    LabeledValueRow(value: "\(chemo.startDate.date)",
                                    label: "Начало терапии")
                case .completed:
                    LabeledValueRow(value: chemo.scheme ?? "no data",
                                    label: "Схема")
                    Divider()
                    LabeledValueRow(value: "\(chemo.numberOfCourses)",
                                    label: "Кол-во курсов")
                    Divider()
                    LabeledValueRow(value: "\(chemo.startDate.date) - \(chemo.endDate.date)",
                                    label: "Период терапии")
                }
            }
        }
    }
}

#Preview {
    PatientCT(medicalRecord: MedicalRecord.MOCK_MedicalRecords[1])
}
