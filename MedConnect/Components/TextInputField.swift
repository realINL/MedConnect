//
//  TextInputField.swift
//  MedConnect
//
//  Created by Илья Лебедев on 13.05.2025.
//

import UIKit
import SwiftUI

struct TextInputField: UIViewRepresentable {
    typealias UIViewType = UITextField
    
    let placeholder: String
    @Binding var text: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    var configuration = { (view: UITextField) in }
    
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.delegate = context.coordinator
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        configuration(uiView)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TextInputField
        
        init(_ parent: TextInputField) {
            self.parent = parent
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
            }
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                // Перемещаем курсор в конец текста
                let endPosition = textField.endOfDocument
                textField.selectedTextRange = textField.textRange(from: endPosition, to: endPosition)
            }
        }
}

#Preview {
    TextInputField("Some text...", text: .constant(""))
        
}

