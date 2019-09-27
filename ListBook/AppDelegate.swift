//
//  AppDelegate.swift
//  ListBook
//
//  Created by Can Behran Kankul on 26.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    public var currentApplication : ListBookApp?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        currentApplication = ListBookApp(server: ServerType.test, rootController: .notes)
        //currentApplication = ListBookApp(server: ServerType.test, rootController: .landing, isStatusBarRequired: true)
        return true
    }

}

