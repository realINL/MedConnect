//
//  TestView.swift
//  MedConnect
//
//  Created by Илья Лебедев on 12.05.2025.
//

import SwiftUI


struct WheelPickerView: View {
    @State private var isPickerVisible: Bool = false
    @Binding var selectedValue: Int
    let titleWheel: String
    let titleInput: String
    let options: [Int]
    let textModifier: KeyPath<Int, String>
    var body: some View {
        
            Button(action: {
                withAnimation {
                    isPickerVisible.toggle()
                }
            }) {
                HStack {
                    Text(titleWheel)
                        .foregroundColor(.primary)
                    Spacer()
                    Group {
                        Text("\(selectedValue[keyPath: textModifier])")
                        Image(systemName: "chevron.up.chevron.down")
                    }
                    .foregroundColor(.secondary)
                }
            }
        
        .sheet(isPresented: $isPickerVisible) {
            VStack{
                BottomSheetPickerView(selectedValue: $selectedValue,
                                      isPresented: $isPickerVisible,
                                      titleWheel: titleWheel,
                                      titleInput: titleInput,
                                      options: options,
                                      textModifier: textModifier)
//            .cornerRadius(20)
            .presentationDetents([.medium, .large, .fraction(0.4)])
            }
        }
//        .overlay(
//            BottomSheetView(isPresented: $isPickerVisible, maxHeight: 300) {
//                VStack {
//                    Text("Выберите значение")
//                        .font(.headline)
//                        .padding(.top)
//                    
//                    Picker("Значение", selection: $selectedValue) {
//                        ForEach(0..<100, id: \.self) {
//                            Text("\($0)")
//                        }
//                    }
//                    .pickerStyle(.wheel)
//                    
//                    Button("Готово") {
//                        withAnimation {
//                            isPickerVisible = false
//                        }
//                    }
//                    .padding()
//                }
//            }
//        )
    }
}

struct BottomSheetPickerView: View {
    @Binding var selectedValue: Int
    @Binding var isPresented: Bool
    let titleWheel: String
    let titleInput: String
    let options: [Int]
    let textModifier: KeyPath<Int, String>
    
    var body: some View {
        VStack{
            Text(titleWheel)
            
            Picker("Значение", selection: $selectedValue) {
                ForEach(options, id: \.self) { option in
                    Text("\(option[keyPath: textModifier])")
                }
            }
            .pickerStyle(.wheel)
            NumberTextField(value: $selectedValue, title: titleInput)
            
            Button{
                isPresented = false
            } label: {
                Text("Confirm")
            }
        }
        .padding()
        .background(Color(.systemGray5))
    }
}


#Preview {
    WheelPickerView(selectedValue: .constant(5), titleWheel: "Минуты", titleInput: "п, минут", options:[Int](0...360), textModifier: \.minutesCount)
}
