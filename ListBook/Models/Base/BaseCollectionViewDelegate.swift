//
//  BaseCollectionViewDelegate.swift
//  ListBook
//
//  Created by Can Behran Kankul on 27.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

protocol CollectionViewActionDelegate: class {
    func didTapCellAt(indexPath: IndexPath)
}

class BaseCollectionViewDelegate: NSObject {
    
    weak var delegate: CollectionViewActionDelegate?
}

