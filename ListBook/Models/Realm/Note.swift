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
    
    static func create(name: String, description: String ) -> Note {
        let note = Note()
        note.id = generateId()
        note.name = name
        note.noteDetail = description
        
        let currentTimeAsInterval = generateDate()
        note.addInterval = currentTimeAsInterval
        note.updateInterval = currentTimeAsInterval
        return note
    }
    
    func convertAddDateToString() -> String {
        let recordedDate = Date(timeIntervalSince1970: TimeInterval(self.addInterval))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        return dateFormatter.string(from: recordedDate)
    }
    func convertUpdateDateToString() -> String {
        let recordedDate = Date(timeIntervalSince1970: TimeInterval(self.updateInterval))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        return dateFormatter.string(from: recordedDate)
    }
}
