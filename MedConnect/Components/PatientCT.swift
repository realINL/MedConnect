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
                LabeledValueRow(value: chemo.staus.description, label: "Статус")
                switch chemo.staus {
                case .none:
                    EmptyView()
                case .partially:
                    Divider()
                    LabeledValueRow(value: "\(chemo.startDate.date)", label: "Начало терапии")
                case .completed(let scheme, let endDate):
                    Divider()
                    LabeledValueRow(value: "\(chemo.numberOfCourses)", label: "Кол-во курсов")
                    Divider()
                    LabeledValueRow(value: "\(chemo.startDate.date) - \(chemo.endDate.date)", label: "Период терапии")
                }
            }
        }
    }
}

#Preview {
    PatientCT(medicalRecord: MedicalRecord.MOCK_MedicalRecords.first!)
}
