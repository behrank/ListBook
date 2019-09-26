//
//  UIApplication.swift
//  ListBook
//
//  Created by Can Behran Kankul on 25.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    
    class var delegate: AppDelegate? {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        return delegate
    }
}
