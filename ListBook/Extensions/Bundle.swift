//
//  Bundle.swift
//  ListBook
//
//  Created by Can Behran Kankul on 27.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import Foundation

extension Bundle {
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleName") as? String
    }
}
