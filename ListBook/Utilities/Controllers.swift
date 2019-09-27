//
//  Controllers.swift
//  ListBook
//
//  Created by Can Behran Kankul on 25.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import Foundation
import UIKit

enum Controller {
    case landing
    case notes
    
    var asViewController: UIViewController {
        switch self {
        case .landing:
            return BaseNavigationController(rootViewController: LandingViewController())
        case .notes:
            return BaseNavigationController(rootViewController: NoteListCollectionViewController(collectionViewLayout: ListBookCollectionViewLayout.defaultFlow.layout))
        }
    }
}
