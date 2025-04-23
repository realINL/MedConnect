//
//  MedConnectApp.swift
//  MedConnect
//
//  Created by Илья Лебедев on 15.01.2025.
//

import SwiftUI

@main
struct MedConnectApp: App {
    @AppStorage("isLogin") var isLogin: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isLogin {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}
