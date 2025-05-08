//
//  SurgeriesListView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 11.05.2025.
//

import SwiftUI

struct SurgeriesListView: View {
    @ObservedObject var viewModel: SurgeriesListViewModel
    @State var search: String = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.surgies, id: \.id) { surgery in
                    NavigationLink{ SurgeryView(surgery: surgery)} label: {
                        SurgeryScrollCardView(surgery: surgery)
                    }
//                    NavigationLink{value: surgery}  {
//                    }
                    Divider()
                }
            }
            //        .searchable(text: $viewModel.search)
            .refreshable {
                viewModel.updateSurgies()
            }
            .onAppear() {
                viewModel.updateSurgies()
            }
           
            .buttonStyle(.plain)
        }
        .navigationTitle("Мои операции")
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
    SurgeriesListView(viewModel: SurgeriesListViewModel(networkManager: FakeNetworkManager()))
}
