//
//  LBTextView.swift
//  ListBook
//
//  Created by Can Behran Kankul on 27.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

class LBTextView: UITextView {

    private var validationStatus: ValidationStatus = .notValid

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
