//
//  DraftListView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 13.05.2025.
//

import SwiftUI

struct DraftListView: View {
    var appViewModel: AppViewModel
    @ObservedObject var viewModel: DraftListViewModel
    @State var draftType: DraftType = .surgery
    var body: some View {
        
        NavigationStack {
            Picker("", selection: $draftType) {
                ForEach(DraftType.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            List {
                
                
                switch (draftType) {
                case .surgery:
                    ForEach(viewModel.surgiesDrafts, id: \.self) { surgeryDraft in
                        NavigationLink {
                            EditSurgeryDraftView(surgery: surgeryDraft, viewModel: appViewModel.createSurgeryViewModel)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(surgeryDraft.surgeryVolume.mainProcedure.rawValue)
                                Text("\(surgeryDraft.date.date) последнее изменение")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        viewModel.deleteDraft(indexSet)
                    }
                
                case .medicalRecord:
                    ForEach(viewModel.medicalRecordsDrafts, id: \.self) { medicalRecord in
    //                    NavigationLink { }
                        VStack(alignment: .leading) {
                            Text(medicalRecord.disease.type.rawValue)
                        }
                    }
                    .onDelete { indexSet in
                        viewModel.deleteDraft(indexSet)
                    }
                }
            }
        }
        .onAppear() {
            viewModel.updateDrafts()
        }
        .refreshable {
            viewModel.updateDrafts()
        }
    }
}

#Preview {
    DraftListView(appViewModel: AppViewModel.MOCK_AppViewModel, viewModel: DraftListViewModel(localManager: FakeLocalManager()))
}

class DraftListViewModel: ObservableObject {
    var localManager: LocalManager
    @Published var surgiesDrafts: [Surgery]
    @Published var medicalRecordsDrafts: [MedicalRecord]
    
    init(localManager: LocalManager) {
        self.localManager = localManager
        self.surgiesDrafts = localManager.getSurgiesDrafts()
        self.medicalRecordsDrafts = localManager.getMedicalRecordsDrafts()
    }
    
    func deleteDraft(_ indexSet: IndexSet) {
        localManager.deleteSurgeryDraft(at: indexSet)
    }
    
    func updateDrafts() {
        self.surgiesDrafts = localManager.getSurgiesDrafts()
    }
    
}

enum DraftType: String, CaseIterable {
    case surgery = "Операции"
    case medicalRecord = "Медкарты"
}
