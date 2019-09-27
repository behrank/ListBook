//
//  Object.swift
//  ListBook
//
//  Created by Can Behran Kankul on 27.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import RealmSwift

extension Object {
    static func generateId() -> Int {
        return generateDate()
    }
    static func generateDate() -> Int {
        return Int(Date().timeIntervalSince1970)
    }
}
