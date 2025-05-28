//
//  SurgeriesListViewModel.swift
//  MedConnect
//
//  Created by Илья Лебедев on 12.05.2025.
//

import Foundation

class SurgeriesListViewModel: ObservableObject {
    let networkManager: NetworkManagerProtocol
    @Published var surgies: [Surgery] = []
    @Published var search: String = ""
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
        Task { await updateSurgies() }
        print("init sur")
    }
    
    var searchSurgies: [Surgery] {
        if search.isEmpty {
            return self.surgies
        } else {
            return self.surgies.filter {$0.surgeryVolume.mainProcedure.rawValue.localizedCaseInsensitiveContains(search)
                || (($0.surgeryVolume.procedureType?.localizedCaseInsensitiveContains(search)) != nil)
                || (($0.surgeryVolume.procrdureModification?.localizedCaseInsensitiveContains(search)) != nil)
                || (($0.patient?.name.localizedCaseInsensitiveContains(search)) != nil)
                || (($0.patient?.surname.localizedCaseInsensitiveContains(search)) != nil)
                || (($0.patient?.patronymic.localizedCaseInsensitiveContains(search)) != nil)
            }
        }
    }
    
    @MainActor
    func updateSurgies() {
        print("vm sur")
        Task {
            try await self.surgies = networkManager.getSurgeies()
        }
    }
}
