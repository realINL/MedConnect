//
//  HospitalComplicationsView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 09.05.2025.
//

import SwiftUI

struct HospitalComplicationsView: View {
    let hospitalComplications: HospitalComplications
    @State var showDetails: Bool = true
    var body: some View {
        CardView(title: NSLocalizedString("HospitalComplications",
                                          comment: "Hospital сomplications"),
                 showDetails: $showDetails) {
            VStack(alignment: .leading) {
                Text("Исход госпитализации")
                    .secondaryTitleStyle()
                
                switch(hospitalComplications.hospitalizationOutcome) {
                case .discharged:
                    LabeledValueRow(value: "\(hospitalComplications.hospitalizationOutcome.rawValue) \(NSLocalizedString("After", comment: "after").lowercased()) \(hospitalComplications.dischargeDay?.daysCount ?? 0.daysCount)",
                                    label: "Исход")
                case .transferred:
                    LabeledValueRow(value: hospitalComplications.hospitalizationOutcome.rawValue,
                                    label: "Исход")
                case .death:
                    LabeledValueRow(value: hospitalComplications.hospitalizationOutcome.rawValue,
                                    label: "Исход")
                }
                

                LabeledValueRow(value: hospitalComplications.reoperationsCount?.description ?? "0",
                                label: "Повторные операции")
                
                if let generalCompliations = hospitalComplications.generalComplications {
                    
                    Text("Общие осложенения")
                        .secondaryTitleStyle()
                    
                    ForEach(generalCompliations, id: \.self) { generealComplication in
                        Text(generealComplication.complication.rawValue)
                            .font(.title3)
                            .bold()
                            .padding(.top)
                        
                        LabeledValueRow(value: generealComplication.cavienDindoGrade.rawValue,
                                        label: "Класс")
                        
                        LabeledValueRow(value: generealComplication.onsetTime,
                                        label: "Срок наступления")
                        
                        LabeledValueRow(value: generealComplication.outcome.rawValue,
                                        label: "Исход")
                    }
                }
                
                Divider()
                
                if let surgicalComplications = hospitalComplications.SurgicalComplications {
                    
                    Text("Хирургические осложенения")
                        .secondaryTitleStyle()
                    
                    ForEach(surgicalComplications, id: \.self) { surgicalComplication in
                        Text(surgicalComplication.complication.rawValue)
                            .font(.title3)
                            .bold()
                            .padding(.top)
                        
                        LabeledValueRow(value: surgicalComplication.cavienDindoGrade.rawValue,
                                        label: "Класс")
                        
                        LabeledValueRow(value: surgicalComplication.onsetTime,
                                        label: "Срок наступления")
                        
                        LabeledValueRow(value: surgicalComplication.outcome.rawValue,
                                        label: "Исход")
                    }
                }
                
                
                
                
            }
        }
    }
}

#Preview {
    HospitalComplicationsView(hospitalComplications: HospitalComplications.MOCK_HospitalComplications)
}
