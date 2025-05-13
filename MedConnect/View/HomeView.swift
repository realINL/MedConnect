//
//  HomeView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 15.01.2025.
//

import SwiftUI

struct HomeView: View {
    var appViewModel: AppViewModel
    @ObservedObject var viewModel: HomeViewModel
    @State var search: String
    @State private var showMenu: Bool
    
    init(appViewModel: AppViewModel, homeViewModel: HomeViewModel) {
        self.appViewModel = appViewModel
        self.viewModel = homeViewModel
        self.search = ""
        self.showMenu = false
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    ScrollView {
                        ForEach(viewModel.searchPatients) { patient in
                            NavigationLink{
                                PatientCardView(patient: patient, networkManager: viewModel.networkManager, localManager: appViewModel.createSurgeryViewModel.localManager)
                            } label: {
                                PatientScrollCardView(patient: patient)
                                    .contentShape(Rectangle())
                            }
                            Divider()
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .refreshable {
                        Task {
                            await viewModel.fetchPatients()
                        }
                    }
                }
                
                Rectangle()
                    .ignoresSafeArea()
                    .opacity(showMenu ? 0.3 : 0)
                    .animation(.default, value: showMenu)
                
                SideMenuView(appViewModel: appViewModel, isShownig: $showMenu)
                    .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width)
                    .animation(.easeInOut, value: showMenu)
                    .transition(.move(edge: .leading))
            }
            .gesture(
                        DragGesture()
                            .onEnded { gesture in
                                // Свайп слева направо (начало жеста близко к левому краю)
                                if gesture.startLocation.x < 50 && gesture.translation.width > 50 {
                                    showMenu = true
                                }
                                // Свайп справа налево (если меню открыто)
                                else if gesture.translation.width < -50 && showMenu {
                                    showMenu = false
                                }
                            }
                    )
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
                ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            MedCardEditView(medCardEditViewModel: MedCardEditViewModel(medicalRecord: MedicalRecord.MOCK_MedicalRecords[0], patient: Patient.MOCK_Patients[0], networkManager: viewModel.networkManager, localManager: FakeLocalManager(), mode: .create))
                        } label: {
                            Image(systemName: "person.crop.circle.badge.plus")
                        }
                }
            }
        }
        .searchable(text: $viewModel.search)
        .onAppear() {
            Task {
                await viewModel.fetchPatients()
            }
        }
    
    }
    
}

#Preview {
    HomeView(appViewModel: AppViewModel.MOCK_AppViewModel, homeViewModel: AppViewModel.MOCK_AppViewModel.homeViewModel)
}
