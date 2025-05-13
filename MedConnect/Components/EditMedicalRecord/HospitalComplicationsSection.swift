//
//  HospitalComplicationsSection.swift
//  MedConnect
//
//  Created by Илья Лебедев on 27.05.2025.
//

import SwiftUI

// MARK: ГОСПИТАЛЬНЫЕ ОСЛОЖНЕНИЯ
//struct HospitalComplicationsSection: View {
//    @ObservedObject var viewModel: MedCardEditViewModel
//    @State private var showingAddComplication = false
//    @State private var editingComplication: (any Complication)?
//    
//    var body: some View {
//        List {
//            // MARK: Общие осложнения
//            Section("Общие осложнения") {
//                ForEach(viewModel.medicalRecord.hospitalComplications.generalComplications, id: \.id) { complication in
//                    complicationRow(complication)
//                }
//                
//                Button {
//                    editingComplication = GenerealComplication()
//                    showingAddComplication.toggle()
//                } label: {
//                    Label("Добавить осложнение", systemImage: "plus")
//                }
//            }
//            
//            // MARK: Хирургические осложнения
//            Section("Хирургические") {
//                ForEach(viewModel.medicalRecord.hospitalComplications.SurgicalComplications, id: \.id) { complication in
//                    complicationRow(complication)
//                }
//                
//                Button {
//                    editingComplication = GenerealComplication()
//                    showingAddComplication.toggle()
//                } label: {
//                    Label("Добавить осложнение", systemImage: "plus")
//                }
//            }
//        }
//        .navigationTitle("Госпитальные осложнения")
//        .sheet(isPresented: $showingAddComplication) {
//                ComplicationEditView(
//                    complication: editingComplication,
//                    onSave: {
//                        newComplication in
//                        viewModel.patchHospitalComplication(newComplication)
//                    },
//                    onDelete: {
//                        complication in
//                        viewModel.removeComplication(complication)
//                    }
//                )
//        }
//    }
//    
//    private func complicationRow(_ complication: any Complication) -> some View {
//        VStack(alignment: .leading) {
//            Text(complication.complicationDescription)
//                .font(.headline)
//            Text("Степень: \(complication.cavienDindoGrade.rawValue)")
//            Text("Срок наступления: \(complication.onsetTime)")
//            Text("Исход: \(complication.outcome.rawValue)")
//        }
//        .contentShape(Rectangle())
//        .onTapGesture {
//            editingComplication = complication
//            showingAddComplication.toggle()
//        }
//    }
//}

struct ComplicationEditView: View {
    let complication: any Complication
    let complicationType: any Complication.Type
    let onSave: (any Complication) -> Void
    let onDelete: (any Complication) -> Void
    @Environment(\.dismiss) var dismiss
    @State var editableComplication: any Complication
    
    
    init(complication:  any Complication, onSave: @escaping (any Complication) -> Void, onDelete: @escaping (any Complication) -> Void) {
        self.complication = complication
        self.complicationType = type(of: complication)
        self.onSave = onSave
        self.onDelete = onDelete
        self._editableComplication = State(initialValue: complication)
    }
    
    var body: some View {
        Form {
            Group {
                if let general = editableComplication as? GenerealComplication {
                    GeneralComplicationEditView(
                        Binding(
                            get: { general },
                            set: { newValue in editableComplication = newValue }
                        )
                    )
                } else if let surgical = editableComplication as? SurgicalComplication {
                    SurgicalComplicationEditView(
                        Binding(
                            get: { surgical },
                            set: { newValue in editableComplication = newValue }
                        )
                    )
                }
            }
            
            Button("Сохранить") {
                onSave(editableComplication)
                dismiss()
            }
            Button("Удалить", role: .destructive) {
                onDelete(editableComplication)
                dismiss()
            }
        }
    }
}

struct GeneralComplicationEditView: View {
    @Binding var generealComplication: GenerealComplication
    
    init(_ complication: Binding<GenerealComplication>) {
        self._generealComplication = complication
        print("GeneralComplicationEditView")
    }
    
    var body: some View {
        Section("Тип осложнения") {
            Picker("Тип", selection: $generealComplication.complication) {
                ForEach(GeneralComplicationType.allCases, id: \.self) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .frame(height: 60)
            .pickerStyle(.menu)
        }
        
        Section("Классификация") {
            Picker("Степень по Clavien-Dindo", selection: $generealComplication.cavienDindoGrade) {
                ForEach(CavienDindoGrade.allCases, id: \.self) { grade in
                    Text(grade.rawValue).tag(grade)
                }
            }
            
            Picker("Исход", selection: $generealComplication.outcome) {
                ForEach(ComplicationOutcome.allCases, id: \.self) { outcome in
                    Text(outcome.rawValue).tag(outcome)
                }
            }
        }
        
        Section("Время возникновения") {
            TextInputField("Время возникновения", text: $generealComplication.onsetTime)
        }
    }
}
struct SurgicalComplicationEditView: View {
    @Binding var surgicalComplication: SurgicalComplication
    init(_ complication: Binding<SurgicalComplication>) {
        self._surgicalComplication = complication
    }
    var body: some View {
        Section("Тип осложнения") {
            Picker("Тип", selection: $surgicalComplication.complication) {
                ForEach(SurgicalComplicationType.allCases, id: \.self) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .frame(height: 60)
            .pickerStyle(.menu)
        }
        
        Section("Классификация") {
            Picker("Степень по Clavien-Dindo", selection: $surgicalComplication.cavienDindoGrade) {
                ForEach(CavienDindoGrade.allCases, id: \.self) { grade in
                    Text(grade.rawValue).tag(grade)
                }
            }
            
            Picker("Исход", selection: $surgicalComplication.outcome) {
                ForEach(ComplicationOutcome.allCases, id: \.self) { outcome in
                    Text(outcome.rawValue).tag(outcome)
                }
            }
        }
        
        Section("Время возникновения") {
            TextInputField("Время возникновения", text: $surgicalComplication.onsetTime)
        }
    }
}

//#Preview {
//    Form {HospitalComplicationsSection(viewModel:
//                                        MedCardEditViewModel(medicalRecord: MedicalRecord.MOCK_MedicalRecords[0], patient: Patient.MOCK_Patients[0]))}
//}
