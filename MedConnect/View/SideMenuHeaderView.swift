//
//  SideMenuHeaderView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.01.2025.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
            .imageScale (.large)
            .foregroundStyle(.white)
            .frame (width: 48, height: 48) .background(.gray)
            .clipShape (RoundedRectangle (cornerRadius: 10))
            .padding (.vertical)
            
            VStack(alignment: .leading, spacing: 6) {
                Text ("Айболит Айболитов")
                    .font(.subheadline)
                Text ("aibolit@gmail.com")
                    .font(.footnote)
                    .tint(.gray)
            }
        }
        
    }
}

#Preview {
    SideMenuHeaderView()
}
