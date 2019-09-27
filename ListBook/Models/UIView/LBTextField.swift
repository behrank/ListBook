//
//  LBTextField.swift
//  ListBook
//
//  Created by Can Behran Kankul on 27.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

class LBTextField: UITextField {

    let inset: CGFloat = 8
    private var validationStatus: ValidationStatus = .notValid

    // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy: inset)
    }

    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: inset, dy: inset)
    }
    
    func validateEntry() {
        if self.text == "" {
            addBorderColor(borderColor: .red)
            validationStatus = .notValid
        } else {
            removeBorderColor()
            validationStatus = .valid
        }
    }
    func isValid() -> Bool {
        return validationStatus == .valid
    }
}
