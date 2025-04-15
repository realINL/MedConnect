//
//  LoginView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 15.01.2025.
//

import SwiftUI

struct LoginView: View {
    @State var loginViewModel = LoginViewModel()
    var body: some View {
        Text("МедКоннект")
            .font(.largeTitle)
            .bold()
            
        TextField("Email", text: $loginViewModel.email)
            .keyboardType(.emailAddress)
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(10)
            .padding()
        
        SecureField("Пароль", text: $loginViewModel.password)
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(10)
            .padding()
        
        Button("Войти") {
            
        }
        .foregroundColor(.white)
        .padding()
        .background(Color(.systemBlue))
        .cornerRadius(10)
        .padding()
        
        
    }
}

#Preview {
    LoginView()
}
