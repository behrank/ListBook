//
//  BaseUIViewController.swift
//  ListBook
//
//  Created by Can Behran Kankul on 25.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUI()
    }
    
    // MARK: UI
    func setupUI() {
        // General setup for UI
        view.backgroundColor = AppTheme.current.background
    }
}