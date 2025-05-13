//
//  MedConnectApp.swift
//  MedConnect
//
//  Created by Илья Лебедев on 15.01.2025.
//

import SwiftUI
import Firebase

@main
struct MedConnectApp: App {
    let networkManager: NetworkManagerProtocol
    let localManager: LocalManagerProtocol
    var appViewModel: AppViewModel
    
    @AppStorage("isLogin") var isLogin: Bool = false
    
    init() {
        FirebaseApp.configure()
//        let nm = NetworkManager()
//        Task {
//            do {
//                try await nm.uploadSurgey(surgery: Surgery.MOCK_Surgery)
//            } catch {
//                print("Error uploading patient: \(error)")
//            }
//        }
        self.networkManager = NetworkManager()
        self.localManager = LocalManager()
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
