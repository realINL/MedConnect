//
//  LoginViewModel.swift
//  MedConnect
//
//  Created by Илья Лебедев on 15.01.2025.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
