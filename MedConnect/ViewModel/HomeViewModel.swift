//
//  HomeViewModel.swift
//  MedConnect
//
//  Created by Илья Лебедев on 15.01.2025.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var search: String = ""
    var searchPatients: [Patient] {
        if self.search.isEmpty {
            return self.patients
        } else {
            return self.patients.filter {$0.name.localizedCaseInsensitiveContains(search)}
        }
    }
        
    var patients: [Patient]
    
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        self.patients = networkManager.getPatients()
    }
    
    func fetchPatients() {
        self.patients = networkManager.getPatients()
    }
    
}
