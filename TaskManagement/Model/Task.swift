//
//  Task.swift
//  TaskManagement
//
//  Created by Владислав Колундаев on 16.04.2022.
//

import RealmSwift

class Task: Object {
    @objc dynamic var title = ""
    @objc dynamic var definition: String?
    @objc dynamic var time = Date()
    @objc dynamic var isDone = false
    
    convenience init(title: String, definition: String?, time: Date) {
        self.init()
        self.title = title
        self.definition = definition
        self.time = time
    }
}
