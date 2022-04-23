//
//  AppDelegate.swift
//  TaskManagement
//
//  Created by Владислав Колундаев on 16.04.2022.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let schemaVersion:UInt64 = 1
        
        let config = Realm.Configuration(
          schemaVersion: schemaVersion,
          
          migrationBlock: { megration, oldSchemaVersion in
            if oldSchemaVersion < schemaVersion {
              
            }
          })
        Realm.Configuration.defaultConfiguration = config
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        print(SupportManager.startOfTheDay() - 1)
        let tasks = realm.objects(Task.self).filter("isDone == %@ OR time <= %@", true, SupportManager.startOfTheDay() - 1)
        for task in tasks {
            StorageManager.deleteObject(task)
        }
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

