//
//  PatientRT.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.04.2025.
//

import SwiftUI

struct PatientRT: View {
    @State var showDetails: Bool = true
    let radiationTherapy: RadiationTherapy
    let medicalRecord: MedicalRecord
    
    init(medicalRecord: MedicalRecord) {
        self.medicalRecord = medicalRecord
        self.radiationTherapy = medicalRecord.radiationTherapy
    }
    var body: some View {
        VStack(alignment: .leading) {
            PatientDetailsCardTitle(title: "Лучевая терапия", showDetails: $showDetails)
            
            if showDetails {
                VStack {
                    LabeledValueRow(value: "Статус", label: radiationTherapy.status.rawValue)
                    switch radiationTherapy.status {
                        
                    case .none:
                        EmptyView()
                        
                    case .partially:
                        Divider()
                        LabeledValueRow(value: "Суммарная очаговаря доза", label: "\(radiationTherapy.tfd?.description ?? "no data")")
                        Divider()
                        LabeledValueRow(value: "Разовая очаговаря доза", label: "\(radiationTherapy.sfd?.description ?? "no data")")
                        Divider()
                        LabeledValueRow(value: "\(radiationTherapy.startDate.date)",
                                        label: "Начало терапии")
                        
                    case .completed:
                        Divider()
                        LabeledValueRow(value: "Суммарная очаговаря доза", label: "\(radiationTherapy.tfd?.description ?? "no data")")
                        Divider()
                        LabeledValueRow(value: "Разовая очаговаря доза", label: "\(radiationTherapy.sfd?.description ?? "no data")")
                        Divider()
                        LabeledValueRow(value: "\(radiationTherapy.startDate.date) - \(radiationTherapy.endDate.date)",
                                        label: "Период терапии")
                    }
                    
                }
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .fill(.background)
                .shadow(radius: 5)
        }
        .padding(.horizontal)
    }
}

#Preview {
    PatientRT(medicalRecord: MedicalRecord.MOCK_MedicalRecords.first!)
}
