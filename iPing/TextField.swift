//
//  TextField.swift
//  iPing
//
//  Created by kakao on 2020/05/04.
//  Copyright © 2020 changman. All rights reserved.
//

import Foundation
import SwiftUI

struct AutoFocusTextField: UIViewRepresentable {
     class Coordinator: NSObject, UITextFieldDelegate {
           
           @Binding var text: String
           @Binding var isResponder : Bool?
           
           
           init(text: Binding<String>, isResponder : Binding<Bool?>) {
               _text = text
               _isResponder = isResponder
           }
           
           func textFieldDidChangeSelection(_ textField: UITextField) {
               text = textField.text ?? ""
           }
           
           func textFieldDidBeginEditing(_ textField: UITextField) {
               DispatchQueue.main.async {
                   self.isResponder = true
               }
           }
           
           func textFieldDidEndEditing(_ textField: UITextField) {
               DispatchQueue.main.async {
                   self.isResponder = false
               }
           }
       }
       
       @Binding var text: String
       @Binding var isResponder : Bool?
       
       var isSecured : Bool = false
       var keyboard : UIKeyboardType
       var placeholder: String?
       
       func makeUIView(context: UIViewRepresentableContext<AutoFocusTextField>) -> UITextField {
           let textField = UITextField(frame: .zero)
           textField.isSecureTextEntry = isSecured
           textField.autocapitalizationType = .none
           textField.autocorrectionType = .no
           textField.keyboardType = keyboard
           textField.delegate = context.coordinator
           textField.textColor = UIColor(named: "blackGray")
           textField.tintColor = UIColor(named: "theme")
           textField.placeholder = placeholder
           return textField
       }
       
       func makeCoordinator() -> AutoFocusTextField.Coordinator {
           return Coordinator(text: $text, isResponder: $isResponder)
       }
       
       func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<AutoFocusTextField>) {
           uiView.text = text
           if isResponder ?? false {
               uiView.becomeFirstResponder()
           }
       }
       
}
//struct CustomTextField: UIViewRepresentable {
//
//    class Coordinator: NSObject, UITextFieldDelegate {
//
//        @Binding var text: String
//        @Binding var isResponder : Bool?
//
//
//        init(text: Binding<String>, isResponder : Binding<Bool?>) {
//            _text = text
//            _isResponder = isResponder
//        }
//
//        func textFieldDidChangeSelection(_ textField: UITextField) {
//            text = textField.text ?? ""
//        }
//
//        func textFieldDidBeginEditing(_ textField: UITextField) {
//            DispatchQueue.main.async {
//                self.isResponder = true
//            }
//        }
//
//        func textFieldDidEndEditing(_ textField: UITextField) {
//            DispatchQueue.main.async {
//                self.isResponder = false
//            }
//        }
//    }
//
//    @Binding var text: String
//    @Binding var isResponder : Bool?
//
//    var isSecured : Bool = false
//    var keyboard : UIKeyboardType
//    var placeholder: String?
//
//    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> UITextField {
//        let textField = UITextField(frame: .zero)
//        textField.isSecureTextEntry = isSecured
//        textField.autocapitalizationType = .none
//        textField.autocorrectionType = .no
//        textField.keyboardType = keyboard
//        textField.delegate = context.coordinator
//        textField.textColor = .clear
//        textField.tintColor = .clear
//        textField.textContentType = .oneTimeCode
//        textField.placeholder = placeholder
//        return textField
//    }
//
//    func makeCoordinator() -> CustomTextField.Coordinator {
//        return Coordinator(text: $text, isResponder: $isResponder)
//    }
//
//    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomTextField>) {
//        uiView.text = text
//        if isResponder ?? false {
//            uiView.becomeFirstResponder()
//        }
//    }
//
//}

struct DefaultTextField: UIViewRepresentable {
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        @Binding var isResponder : Bool?
        
        
        init(text: Binding<String>, isResponder : Binding<Bool?>) {
            _text = text
            _isResponder = isResponder
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.isResponder = true
            }
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.isResponder = false
            }
        }
    }
    
    @Binding var text: String
    @Binding var isResponder : Bool?
    
    var isSecured : Bool = false
    var keyboard : UIKeyboardType
    var placeholder: String?
    
    func makeUIView(context: UIViewRepresentableContext<DefaultTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.isSecureTextEntry = isSecured
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.keyboardType = keyboard
        textField.delegate = context.coordinator
        textField.textColor = UIColor(named: "blackGray")
        textField.tintColor = UIColor(named: "theme")
        textField.placeholder = placeholder
        return textField
    }
    
    func makeCoordinator() -> DefaultTextField.Coordinator {
        return Coordinator(text: $text, isResponder: $isResponder)
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<DefaultTextField>) {
        uiView.text = text
        if isResponder ?? false {
            uiView.becomeFirstResponder()
        }
    }
    
}
