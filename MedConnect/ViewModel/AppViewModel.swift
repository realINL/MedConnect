//
//  AppViewModel.swift
//  MedConnect
//
//  Created by Илья Лебедев on 12.05.2025.
//

import Foundation

struct AppViewModel {
    var loginViewModel: LoginViewModel
    var homeViewModel: HomeViewModel
    var createSurgeryViewModel: CreateSurgeryViewModel
    var surgeriesListViewModel: SurgeriesListViewModel
    var draftListViewModel: DraftListViewModel
    var edirSurgeryViewModel: CreateSurgeryViewModel
}

extension AppViewModel {
    private static var networkManager: NetworkManager = FakeNetworkManager()
    private static var localManager: LocalManager = FakeLocalManager()
    static let MOCK_AppViewModel: AppViewModel = AppViewModel(loginViewModel: LoginViewModel(),
                                                              homeViewModel: HomeViewModel(networkManager: networkManager),
                                                              createSurgeryViewModel: CreateSurgeryViewModel(networkManager: networkManager, localManager: FakeLocalManager()),
                                                              surgeriesListViewModel: SurgeriesListViewModel(networkManager: networkManager),
                                                              draftListViewModel: DraftListViewModel(localManager: localManager), edirSurgeryViewModel: CreateSurgeryViewModel(networkManager: networkManager, localManager: localManager))
}
