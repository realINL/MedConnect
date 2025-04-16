//
//  PatientCardView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.01.2025.
//

import SwiftUI

struct PatientCardView: View {
    //    let patient: Patient
    var body: some View {
        //        VStack {
        //            Text("Катра пациента")
        //                .fontWeight(.bold)
        //            HStack{
        //                Image(systemName: "person.fill")
        //                Text("\(patient.surname) \(patient.name) \(patient.patronymic), \(patient.age) лет")
        //                Spacer()
        //            }
        //            .padding()
        //            Divider()
        //            
        //            HStack {
        //                Image(systemName: "list.clipboard")
        //                Text(patient.disease)
        //                Spacer()
        //            }
        //            .padding()
        //            
        //            
        //            Spacer()
        //        }
        //        
        //        Button("Править") {}
        //            .foregroundColor(.white)
        //            .padding()
        //            .background(Color(.systemBlue))
        //            .cornerRadius(10)
        //            .padding()
        //            
        //    }
        VStack(spacing: 10) {
            PatienHeaderInfo()
            PatientHW()
            PatientMetrics()
            PatientCaprini()
            PatientCharlson()
            PatientDiagnos()
        }
    }
}

#Preview {
    PatientCardView()
}
