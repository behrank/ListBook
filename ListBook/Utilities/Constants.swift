//
//  Constants.swift
//  ListBook
//
//  Created by Can Behran Kankul on 25.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import Foundation

enum ServerType {
    case production
    case test
    case mock
    
    mutating func serverUrl() ->String {
        switch self {
        case .production:
            return ""
        case .test:
            return ""
        case .mock:
            return ""
        }
    }
}
