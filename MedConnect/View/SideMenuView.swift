//
//  SideMenuView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.01.2025.
//

import SwiftUI

struct SideMenuView: View {
    var appViewModel: AppViewModel
    @Binding var isShownig: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                if true {
                    Rectangle()
                        .opacity(0.0001)
                        .ignoresSafeArea()
                        .onTapGesture { isShownig.toggle() }
                    HStack {
                        VStack(alignment: .leading, spacing: 32) {
                            SideMenuHeaderView()
                            NavigationLink {
                                StatView()
                            } label: {
                                Label("Моя статистика", systemImage: "chart.bar.xaxis")
                            }
                          
                            NavigationLink {
                                SurgeriesListView(viewModel: appViewModel.surgeriesListViewModel)
                            } label: {
                                Label("Операции", systemImage: "stethoscope")
                            }
                            NavigationLink{
                                CreateSurgeryView(viewModel: appViewModel.createSurgeryViewModel)
                            }label: {
                                Label("Добавить операцию", systemImage: "syringe")
                            }
                            NavigationLink {
                                DraftListView(appViewModel: appViewModel, viewModel: appViewModel.draftListViewModel)
                            } label: {
                                Label("Черновики", systemImage: "square.and.pencil")
                            }
                            Spacer()
                            Button {
                                UserDefaults.standard.set(false, forKey: "isLogin")
                            } label: {
                                Label("Выйти из аккаунта", systemImage: "door.left.hand.open")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding()
                        .frame(width: 270, alignment: .leading)
                        .background(Color(.systemBackground))
                        .buttonStyle(.plain)
                        
                        Spacer()
                    }
                    
                    
                }
            }
            .transition(.move(edge: .leading))
            .animation(.easeInOut, value: isShownig)
        }
    }
}

//#Preview {
//    SideMenuView(isShownig: .constant(true))
//}
