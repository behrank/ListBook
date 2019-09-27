//
//  BaseCollectionViewController.swift
//  ListBook
//
//  Created by Can Behran Kankul on 25.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

class BaseCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        setupUI()
    }
    
    // MARK: UI
    func setupUI() {
        // General setup for UI
        view.backgroundColor = AppTheme.current.background
    }
}
