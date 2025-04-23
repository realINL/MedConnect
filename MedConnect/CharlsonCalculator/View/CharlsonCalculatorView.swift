//
//  CharlsonCalculatorView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 23.04.2025.
//

import SwiftUI

struct CharlsonCalculatorView: View {
    @ObservedObject var viewModel: CharlsonCalculatorViewModel
    @State var showResetConfirmation: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                
                CharsonScoreUIComponent(survivalLevel: viewModel.survivalLevel)
                CharlsonRiskFactorsUIComponent(binding: binding(key:))
                
                Section {
                    ListButtonCentredTextUIComponent(text: "Сохранить",
                                                     textColor: .blue,
                                                     action: { viewModel.updatePatientCharlson() }
                    )
                }
                
                Section {
                    ListButtonCentredTextUIComponent(text: "Очистить форму",
                                                     textColor: .red,
                                                     action: { showResetConfirmation.toggle() }
                    )
                    .confirmationDialog("Очистить форму?",
                                        isPresented: $showResetConfirmation,
                                        titleVisibility: .visible) {
                        Button("Очистить",
                               role: .destructive) {
                            viewModel.resetSelections()
                        }
                    }
                }
            }
            .navigationTitle("Калькулятор Чарльсона")
        .listStyle(.insetGrouped)
        }
    }
    
    private func binding(key: Int) -> Binding<Bool> {
        Binding(
            get: {viewModel.selections[key] ?? false },
            set: { viewModel.selections[key] = $0}
        )
    }
}

#Preview {
    CharlsonCalculatorView(viewModel: CharlsonCalculatorViewModel(patient: Patient.MOCK_Patients[2]))
}
