//
//  Book.swift
//  ListBook
//
//  Created by Can Behran Kankul on 26.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import RealmSwift

class Note: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var noteDetail = ""
    @objc dynamic var addInterval = 0
    @objc dynamic var updateInterval = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
