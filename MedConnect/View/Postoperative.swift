//
//  Postoperative.swift
//  MedConnect
//
//  Created by Илья Лебедев on 08.05.2025.
//

import SwiftUI

struct Postoperative: View {
    let postoperativeCourse: PostoperativeCourse
    @State var showDetails: Bool = true
    var body: some View {
        VStack(alignment: .leading) {
            PatientDetailsCardTitle(title: NSLocalizedString("postoperativeCourse", comment: "postoperativeCourse"), showDetails: $showDetails)
            if showDetails {
                Text("ExtubationOnTable")
                    .secondaryTitleStyle()
                
                Text(postoperativeCourse.extubationOnTable.rawValue)    // vf
                Text ("Койко-дни в ОРИТ")
                    .secondaryTitleStyle()
                Text(postoperativeCourse.icitDays.daysCount)
                
                Text("Возобновление питания")
                    .secondaryTitleStyle()
                HStack {
                    
                    //                Spacer()
                    
                    if let sippngDay = postoperativeCourse.nutritionResumption.sippingDay {
                        VStack(alignment: .leading) {
                            Text("Сиппинг")
                                .thirdlyTitleStyle()
                            Text(sippngDay.day)
                        }
                    }
                    
                                    Spacer()
                    
                    if let drinkingDay = postoperativeCourse.nutritionResumption.drinkingDay {
                        VStack(alignment: .leading) {
                            Text("Питье")
                                .thirdlyTitleStyle()
                            Text(drinkingDay.day)
                        }
                    }
                    
                                    Spacer()
                    
                    if let eatingDay = postoperativeCourse.nutritionResumption.eatingDay {
                        VStack(alignment: .leading) {
                            Text("Еда")
                                .thirdlyTitleStyle()
                            Text(eatingDay.day)
                        }
                    }
                    
                                    Spacer()
                    
                }
                
                Text("Антибактериальная терапия")
                    .secondaryTitleStyle()
                
                if let antibioticTherapy = postoperativeCourse.antibioticTherapy {
                    Text("\(antibioticTherapy.medication) \(antibioticTherapy.dosage) \(NSLocalizedString("mg", comment: "mg"))")
                    Text(antibioticTherapy.duration.daysCount)
                }
                
                if let drainRemoval = postoperativeCourse.drainRemoval {
                    
                    Text("Срок удаления дренажей")
                        .secondaryTitleStyle()
                    Text("\(NSLocalizedString("after", comment: "After")) \(drainRemoval.drain1Day?.daysCount ?? "")")
                    Text("\(NSLocalizedString("after", comment: "After")) \(drainRemoval.drain2Day?.daysCount ?? "")")
                    Text("\(NSLocalizedString("after", comment: "After")) \(drainRemoval.drain3Day?.daysCount ?? "")")
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
    Postoperative(postoperativeCourse: PostoperativeCourse.MOCK_PostoperativeCourse)
}
