//
//  SurgeryScrollCardView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 12.05.2025.
//

import SwiftUI

struct SurgeryScrollCardView: View {
    let surgery: Surgery
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "stethoscope")
                Text(surgery.surgeryVolume.mainProcedure.rawValue)
//                Text("patient.name")
//                Text("patient.patronymic")
                Spacer()
                Image(systemName: "chevron.right")
            }
            HStack {
                Image(systemName: "calendar")
                Text(surgery.date.date)
                Group{
                    Image(systemName: "person")
                    Text(surgery.patient?.surnameInitials ?? "")
                }
                    .foregroundStyle(.secondary)
                Spacer()
            }
        }
        .padding()
       
    }
}

#Preview {
    ForEach(1...5, id: \.self) {i in
        SurgeryScrollCardView(surgery: Surgery.MOCK_Surgery)
    }
}
