//
//  ListBookApp.swift
//  ListBook
//
//  Created by Can Behran Kankul on 25.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import Foundation
import UIKit

class ListBookApp {
    var window: UIWindow?
    var currentServer : ServerType
    var rootViewController : Controller
    
    /// call init method at application launch
    ///
    /// - Parameter server: Prod, test or mock
    /// - Parameter rootController: view
    
    init(server: ServerType, rootController: Controller, isStatusBarRequired: Bool = false) {
        
        currentServer = server
        rootViewController = rootController
        startAppWithRootView()
        
        if isStatusBarRequired {
            addStatusBackgroundView()
        }
        
        Logger.info(message: "App initalized")
    }
    
    private func startAppWithRootView() {
        window = UIApplication.shared.windows.first
        window?.makeKeyAndVisible()
        window?.rootViewController = rootViewController.asViewController
        Logger.info(message: "Root controller set")
    }
    
    private func addStatusBackgroundView() {
        
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = UIColor.white
        
        window?.addSubviews(views: statusBarBackgroundView)
        window?.addConstraintsWithFormat(format: "H:|[v0]|", views: statusBarBackgroundView)
        window?.addConstraintsWithFormat(format: "V:|[v0(\(UIApplication.shared.statusBarFrame.height))]", views: statusBarBackgroundView)
    }
}
