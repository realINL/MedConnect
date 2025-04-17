//
//  HomeView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 15.01.2025.
//

import SwiftUI

struct HomeView: View {
    @State var search: String = ""
    @State private var showMenu: Bool = false
    var body: some View {
        NavigationStack {
            //            ScrollView {
            //                ForEach(searchPatients) { patient in
            //                    NavigationLink(value: patient) {
            //                        PatientScrollCardView(patient: patient)
            //                    }
            //                    Divider()
            //                }
            //            }
            //            .navigationDestination(for: Patient.self, destination:  { patient in PatientCardView(patient: patient) })
            //            .buttonStyle(PlainButtonStyle())
            ZStack {
                ScrollView {
                    ForEach(searchPatients) { patient in
                        NavigationLink(value: patient) {
                            PatientScrollCardView(patient: patient)
                        }
                        Divider()
                    }
                }
                .navigationDestination(for: Patient.self, destination:  { patient in PatientCardView(patient: patient) })
                .buttonStyle(PlainButtonStyle())
                
                SideMenuView(isShownig: $showMenu)
            }
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                    })
                    
                }
            }
        }
                .searchable(text: $search)
        
        
        
        //        Spacer()
    }
    
    var searchPatients: [Patient] {
        if search.isEmpty {
            return Patient.MOCK_Patients
        } else {
            return Patient.MOCK_Patients.filter {$0.name.localizedCaseInsensitiveContains(search)}
        }
    }
}

#Preview {
    HomeView()
}
