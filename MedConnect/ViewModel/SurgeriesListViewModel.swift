//
//  SurgeriesListViewModel.swift
//  MedConnect
//
//  Created by Илья Лебедев on 12.05.2025.
//

import Foundation

class SurgeriesListViewModel: ObservableObject {
    let networkManager: NetworkManager
    @Published var surgies: [Surgery]
    @Published var search: String = ""
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        self.surgies = networkManager.getSurgeies()
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
    
    func updateSurgies() {
        self.surgies = networkManager.getSurgeies()
    }
}
