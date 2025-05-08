//
//  DoubleTextField.swift
//  MedConnect
//
//  Created by Илья Лебедев on 13.05.2025.
//

import UIKit
import SwiftUI

struct DoubleTextField: UIViewRepresentable {
    @Binding var value: Double
    let title: String
    let keyboardType: UIKeyboardType = UIKeyboardType.decimalPad
    
    func makeUIView(context: Context) -> UIView {
        let containerView = UIView()
        
        // Настройка HStack-подобной структуры
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        containerView.addSubview(stackView)
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = title.components(separatedBy: ",").first?.trimmingCharacters(in: .whitespaces) ?? title
        titleLabel.setContentHuggingPriority(.required, for: .horizontal)
        stackView.addArrangedSubview(titleLabel)
        
        
        
        // TextField
        let textField = UITextField()
        textField.keyboardType = keyboardType
        textField.textAlignment = .right
        textField.text = String(value)
        textField.delegate = context.coordinator
        stackView.addArrangedSubview(textField)
        
        // Suffix Label
        let suffixLabel = UILabel()
        suffixLabel.text = title.components(separatedBy: ",").last?.trimmingCharacters(in: .whitespaces)
        suffixLabel.textColor = .gray
        stackView.addArrangedSubview(suffixLabel)
        
        // Layout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        return containerView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        guard let stackView = uiView.subviews.first as? UIStackView,
              let textField = stackView.arrangedSubviews[1] as? UITextField else { return }
        
        textField.text = String(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: DoubleTextField
        
        init(_ parent: DoubleTextField) {
            self.parent = parent
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            if let text = textField.text, let number = Double(text) {
                DispatchQueue.main.async{
                    self.parent.value = number
                }
                    
            }
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                // Перемещаем курсор в конец текста
                let endPosition = textField.endOfDocument
                textField.selectedTextRange = textField.textRange(from: endPosition, to: endPosition)
            }
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            // Разрешаем только цифры
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
    }
}

#Preview {
    DoubleTextField(value: .constant(7), title: "Ddtlbnt, mm")
        
}

