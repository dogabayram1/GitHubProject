//
//  RoundedTextFieldExtension.swift
//  GitHubProject
//
//  Created by Doğa Bayram on 18.01.2022.
//

import UIKit


extension UITextField {
    func roundTextField() {
        if placeholder != nil {
            let placeholder = NSAttributedString(string: placeholder ?? "", attributes: [.foregroundColor : #colorLiteral(red: 0.347639865, green: 0.4212076147, blue: 1, alpha: 1)])
            attributedPlaceholder = placeholder
        }
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = frame.height / 2
        layer.borderColor = #colorLiteral(red: 0.347639865, green: 0.4212076147, blue: 1, alpha: 1)
        layer.borderWidth = 2
    }
}
