//
//  SideMenuView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.01.2025.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var isShownig: Bool
    var body: some View {
        ZStack {
            if isShownig {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { isShownig.toggle() }
                HStack {
                    VStack(alignment: .leading, spacing: 32) {
                        SideMenuHeaderView()
                        Label("Черновики", systemImage: "square.and.pencil")
                        Label("Моя статистика", systemImage: "chart.bar.xaxis")
                        Label("Добавить операцию", systemImage: "syringe")
                        Spacer()
                        Button {
                            
                        } label: {
                            Label("Выйти из аккаунта", systemImage: "door.left.hand.open")
                                .foregroundColor(.red)
                        }
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(Color(.systemBackground))
                    
                    Spacer()
                }
                
                
            }
        }
        .transition(.move(edge: .leading))
        .animation(.easeInOut, value: isShownig)
    }
}

#Preview {
    SideMenuView(isShownig: .constant(true))
}
