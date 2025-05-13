//
//  v.swift
//  MedConnect
//
//  Created by Илья Лебедев on 26.05.2025.
//

import SwiftUI

// MARK: - Scheme Selection View
struct SchemeSelectionView: View {
    @Binding var selectedScheme: String
    @State var schemeToSelect: String
    @State private var customScheme: String
    @Environment(\.dismiss) private var dismiss
    
    init(selectedScheme: Binding<String>) {
        self._selectedScheme = selectedScheme
        if let scheme = ChemotherapyScheme(rawValue: selectedScheme.wrappedValue)?.rawValue {
            self.schemeToSelect = scheme
            self.customScheme = ""
            
        } else {
            self.schemeToSelect = ChemotherapyScheme.custom.rawValue
            self.customScheme = selectedScheme.wrappedValue
        }
        
    }
    
    var body: some View {
        NavigationView {
            List {
                Section("Стандартные схемы") {
                    ForEach(ChemotherapyScheme.allCases, id: \.self) { scheme in
                        Button {
                            schemeToSelect = scheme.rawValue
                        } label: {
                            HStack {
                                Text(scheme.rawValue)
                                Spacer()
                                if schemeToSelect == scheme.rawValue {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                            .contentShape(Rectangle())
                        }
                    }
                }
                .buttonStyle(.plain)
                
                if case ChemotherapyScheme.custom.rawValue = schemeToSelect {
                    Section("Кастомная схема") {
                        TextInputField("Введите название схемы", text: $customScheme)
                        
                        Button("Сохранить кастомную схему") {
                            if !customScheme.isEmpty {
                                selectedScheme = customScheme
                                dismiss()
                            }
                        }
                        .disabled(customScheme.isEmpty)
                    }
                }
            }
            .navigationTitle("Выбор схемы")
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .cancellationAction) {
//                    Button("Сохранить") {
//                        if !customScheme.isEmpty{
//                            selectedScheme = customScheme
//                        } else {
//                            selectedScheme = schemeToSelect
//                        }
//                        dismiss()
//                    }
//                }
//            }
            .onChange(of: schemeToSelect) { newValue in
                customScheme = ""
            }
            
        }
        .onDisappear() {
            if !customScheme.isEmpty{
                selectedScheme = customScheme
            } else {
                selectedScheme = schemeToSelect
            }
        }
    }
        
}

#Preview {
    SchemeSelectionView(selectedScheme: .constant("кастом"))
}
