//
//  CapriniCalculatorView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 20.04.2025.
//

import SwiftUI

struct CapriniCalculatorView: View {
    @ObservedObject var viewModel: CapriniCalculatorViewModel = CapriniCalculatorViewModel(patientId: 0)
    
    @State private var showResetConfirmation = false
    @State private var selections: [Int: Bool] = [:]
    @State private var totalScore = 0
    
    var body: some View {
        NavigationStack {
            List {
                
                OrganismStateFactorsView(binding: binding(for:))
                TraumaFactrosView(binding: binding(for:))
                
                TotalScoreUIComponent(totalScore: viewModel.totalScore)
                
                RiskLevelIUComponent()
                
                
                
                Section {
                    ListButtonCentredTextUIComponent(text: "Сохранить",
                                                     textColor: .blue,
                                                     action: { viewModel.updatePatientCaprini() }
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
            .navigationTitle("Калькулятор Каприни")
            .listStyle(.insetGrouped)
        }
    }
    
    private func binding(for key: Int) -> Binding<Bool> {
        Binding(
            get: { viewModel.selections[key] ?? false },
            set: { viewModel.selections[key] = $0 }
        )
    }
}

#Preview {
    CapriniCalculatorView()
}


