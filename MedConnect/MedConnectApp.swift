//
//  MedConnectApp.swift
//  MedConnect
//
//  Created by Илья Лебедев on 15.01.2025.
//

import SwiftUI

@main
struct MedConnectApp: App {
    let networkManager: NetworkManager
    let localManager: LocalManager
    var appViewModel: AppViewModel
    
    @AppStorage("isLogin") var isLogin: Bool = false
    
    init() {
        self.networkManager = FakeNetworkManager()
        self.localManager = FakeLocalManager()
        self.appViewModel = AppViewModel(loginViewModel: LoginViewModel(),
                                         homeViewModel: HomeViewModel(networkManager: networkManager),
                                         createSurgeryViewModel: CreateSurgeryViewModel(networkManager: networkManager,
                                                                                        localManager: localManager),
                                         surgeriesListViewModel: SurgeriesListViewModel(networkManager: networkManager),
                                         draftListViewModel: DraftListViewModel(localManager: localManager),
                                         edirSurgeryViewModel: CreateSurgeryViewModel(networkManager: networkManager,
                                                                                      localManager: localManager))
        self.isLogin = isLogin
    }
    
    var body: some Scene {
        WindowGroup {
            if isLogin {
                HomeView(appViewModel: appViewModel, homeViewModel: appViewModel.homeViewModel)
            } else {
                LoginView()
            }
        }
    }
}
