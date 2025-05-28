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
    @Published var isLoading: Bool = true
    var searchPatients: [Patient] {
        if self.search.isEmpty {
            return self.patients
        } else {
            return self.patients.filter {$0.name.localizedCaseInsensitiveContains(search)}
        }
    }
        
    var patients: [Patient] = []
    
    let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
        Task { await fetchPatients() }
    }
    
    @MainActor
    func fetchPatients() async {
        self.isLoading = true
        
        do {
            let fetchedPatients = try await networkManager.getPatients()
            self.patients = fetchedPatients
        } catch {
            print("Failed to fetch patients: \(error)")
        }
        
        self.isLoading = false
    }
    
}
