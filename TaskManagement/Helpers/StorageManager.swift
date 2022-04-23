//
//  StorageManager.swift
//  TaskManagement
//
//  Created by Владислав Колундаев on 20.04.2022.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
  
  static func saveObject(_ task: Task) {
    try! realm.write {
        realm.add(task)
    }
  }
  
  static func deleteObject(_ task: Task) {
    try! realm.write {
      realm.delete(task)
    }
  }
}
