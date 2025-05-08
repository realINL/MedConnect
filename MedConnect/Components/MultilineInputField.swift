//
//  InputField.swift
//  MedConnect
//
//  Created by Илья Лебедев on 12.05.2025.
//

import Foundation
import UIKit
import SwiftUI

struct MultilineInputField: View {
    @Binding var text: String
    let title: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
            TextView(text: $text)
            .frame(height: 70)
        }
    }
}

struct TextView: UIViewRepresentable {
    typealias UIViewType = UITextView

    @Binding var text: String  // Привязка для текста
    var configuration = { (view: UITextView) in }

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.textAlignment = .right
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<Self>) {
        uiView.text = text
        configuration(uiView)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var parent: TextView

        init(_ parent: TextView) {
            self.parent = parent
        }

        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
}

//struct InputField: UIViewRepresentable {
//    @Binding var value: String
//    let title: String
//    let placeholder: String
//    let minHeight: CGFloat
//    let maxHeight: CGFloat
//    
//    func makeUIView(context: Context) -> UIView {
//        let containerView = UIView()
//        
//        // Настройка StackView
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .top
//        stackView.distribution = .fill
//        stackView.spacing = 8
//        containerView.addSubview(stackView)
//        
//        // Title Label
//        let titleLabel = UILabel()
//        titleLabel.text = title
//        titleLabel.numberOfLines = 0
//        titleLabel.setContentHuggingPriority(.required, for: .horizontal)
//        stackView.addArrangedSubview(titleLabel)
//        
//        // Spacer
//        let spacer = UIView()
//        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
//        stackView.addArrangedSubview(spacer)
//        
//        // Text View
//        let textView = UITextView()
//        textView.text = value
//        textView.font = UIFont.preferredFont(forTextStyle: .body)
//        textView.backgroundColor = .blue
//        textView.layer.cornerRadius = 5
//        textView.isScrollEnabled = false // Отключаем скролл для динамического размера
//        textView.delegate = context.coordinator
//        // Настройка динамического размера
//        textView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        textView.setContentCompressionResistancePriority(.required, for: .vertical)
//        
//        stackView.addArrangedSubview(textView)
//        
//        // Констрейнты для StackView
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
//            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
//        ])
//        
//        // Сохраняем ссылки в Coordinator
//        context.coordinator.textView = textView
//        context.coordinator.containerView = containerView
//        context.coordinator.minHeight = minHeight
//        context.coordinator.maxHeight = maxHeight
//        
//        // Первоначальный расчет размера
//        context.coordinator.updateTextViewHeight()
//        
//        return containerView
//    }
//    
//    func updateUIView(_ uiView: UIView, context: Context) {
//        guard let textView = context.coordinator.textView else { return }
//        
//        if textView.text != value {
//            textView.text = value
//            context.coordinator.updateTextViewHeight()
//        }
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//    
//    class Coordinator: NSObject, UITextViewDelegate {
//        var parent: InputField
//        weak var textView: UITextView?
//        weak var containerView: UIView?
//        var minHeight: CGFloat = 40
//        var maxHeight: CGFloat = 200
//        var heightConstraint: NSLayoutConstraint?
//        
//        init(_ parent: InputField) {
//            self.parent = parent
//        }
//        
//        func updateTextViewHeight() {
//            guard let textView = textView else { return }
//            
//            // Рассчитываем необходимую высоту
//            let fixedWidth = textView.frame.size.width
//            let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//            
//            // Применяем ограничения min/max высоты
//            let newHeight = max(minHeight, min(newSize.height, maxHeight))
//            
//            // Обновляем констрейнт высоты
//            if heightConstraint == nil {
//                heightConstraint = textView.heightAnchor.constraint(equalToConstant: newHeight)
//                heightConstraint?.isActive = true
//            } else {
//                heightConstraint?.constant = newHeight
//            }
//            
//            // Анимируем изменение размера
//            UIView.animate(withDuration: 0.2) {
//                self.containerView?.superview?.layoutIfNeeded()
//            }
//        }
//        
//        func textViewDidChange(_ textView: UITextView) {
//            parent.value = textView.text
//            updateTextViewHeight()
//        }
//        
//        func textViewDidBeginEditing(_ textView: UITextView) {
//            DispatchQueue.main.async {
//                let endPosition = textView.endOfDocument
//                textView.selectedTextRange = textView.textRange(from: endPosition, to: endPosition)
//            }
//        }
//    }
//}

#Preview {
    MultilineInputField(text: .constant(""), title: "Enter Text")
}
