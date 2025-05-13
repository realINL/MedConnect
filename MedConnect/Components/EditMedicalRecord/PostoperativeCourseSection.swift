//
//  PostoperativeCourseSection.swift
//  MedConnect
//
//  Created by Илья Лебедев on 27.05.2025.
//

import SwiftUI

struct PostoperativeCourseSection: View {
    @ObservedObject var viewModel: MedCardEditViewModel

    var body: some View {
        Section{
            // MARK: Экстубация на столе
            QuickSelectPicker(title: "Экстубация на столе",
                              selection: $viewModel.medicalRecord.postoperativeCourse.extubationOnTable,
                              options: YesNo.allCases)
            
            // MARK: Койко-дни в ОРИТ
            WheelPickerView(selectedValue:  $viewModel.medicalRecord.postoperativeCourse.icitDays, titleWheel: "Койко-дни в ОРИТ", titleInput: "Койко-дни в ОРИТ", options: [Int](0...30), textModifier: \.daysCount)
        }
            
            // MARK: Возобновление питания
        Section("Возобновление питания") {
            // MARK: Сиппинг
            WheelPickerView(selectedValue:  $viewModel.medicalRecord.postoperativeCourse.nutritionResumption.sippingDay.toUnwrapped(defaultValue: 0),
                            titleWheel: "Возобновление питания",
                            titleInput: "Возобновление питания",
                            options: [Int](0...30),
                            textModifier: \.daysCount)
            
            // MARK: Питье
            WheelPickerView(selectedValue:  $viewModel.medicalRecord.postoperativeCourse.nutritionResumption.drinkingDay.toUnwrapped(defaultValue: 0),
                            titleWheel: "Питье",
                            titleInput: "Питье",
                            options: [Int](0...30),
                            textModifier: \.daysCount)
            
            
            // MARK: Еда
            WheelPickerView(selectedValue:  $viewModel.medicalRecord.postoperativeCourse.nutritionResumption.eatingDay.toUnwrapped(defaultValue: 0),
                            titleWheel: "Еда",
                            titleInput: "Еда",
                            options: [Int](0...30),
                            textModifier: \.daysCount)
            
        }
            
            // MARK: Антибактериальная терапия
        Section("Антибактериальная терапия") {
            // MARK: Лекарство
            TextInputField("Лекарство", text: $viewModel.medicalRecord.postoperativeCourse.antibioticTherapy.medication)
            
            // MARK: Дозировка
            WheelPickerView(selectedValue:  $viewModel.medicalRecord.postoperativeCourse.antibioticTherapy.dosage,
                            titleWheel: "Дозировка, мг",
                            titleInput: "Дозировка, мг",
                            options: [Int](0...30),
                            textModifier: \.mg)
            
            // MARK: Длительность
            WheelPickerView(selectedValue:  $viewModel.medicalRecord.postoperativeCourse.antibioticTherapy.duration,
                            titleWheel: "Длительность, дней",
                            titleInput: "Длительность, дней",
                            options: [Int](0...90),
                            textModifier: \.daysCount)
        }
            // MARK: Срок удаления дренажей
        Section("Срок удаления дренажей") {
            // MARK: 1
            WheelPickerView(selectedValue:  $viewModel.medicalRecord.postoperativeCourse.drainRemoval.drain1Day.toUnwrapped(defaultValue: 0),
                            titleWheel: "Срок удаления дренажей 1",
                            titleInput: "Срок удаления дренажей 1",
                            options: [Int](0...360),
                            textModifier: \.daysCount)
            // MARK: 2
            WheelPickerView(selectedValue:  $viewModel.medicalRecord.postoperativeCourse.drainRemoval.drain2Day.toUnwrapped(defaultValue: 0),
                            titleWheel: "Срок удаления дренажей 2",
                            titleInput: "Срок удаления дренажей 2",
                            options: [Int](0...360),
                            textModifier: \.daysCount)
            // MARK: 3
            WheelPickerView(selectedValue:  $viewModel.medicalRecord.postoperativeCourse.drainRemoval.drain3Day.toUnwrapped(defaultValue: 0),
                            titleWheel: "Срок удаления дренажей 3",
                            titleInput: "Срок удаления дренажей 3",
                            options: [Int](0...360),
                            textModifier: \.daysCount)
        }
        
            
        .navigationTitle("Послеоперационное течение")
    }
}

#Preview {
    Form{ PostoperativeCourseSection(viewModel: MedCardEditViewModel(medicalRecord: MedicalRecord.MOCK_MedicalRecords[0], patient: Patient.MOCK_Patients[0], networkManager: FakeNetworkManager(), localManager: FakeLocalManager())) }
}
