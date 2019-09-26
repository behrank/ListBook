//
//  Theme.swift
//  ListBook
//
//  Created by Can Behran Kankul on 25.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

enum AppTheme {
    
    case current
    
    var textColor: UIColor {
        if #available(iOS 13.0, *) {
            return .white
        } else {
            return .white
        }
    }
    var menuTextColor: UIColor {
        if #available(iOS 13.0, *) {
            return .label
        } else {
            return .black
        }
    }
    var navigationBarColor: UIColor {
        if #available(iOS 13.0, *) {
              return .tertiarySystemBackground
          } else {
              return .white
          }
    }
    var collectionViewBackground: UIColor {
        if #available(iOS 13.0, *) {
              return .systemBackground
          } else {
              return .white
          }
    }
    var collectionCellBackground: UIColor {
        if #available(iOS 13.0, *) {
              return .tertiarySystemBackground
          } else {
              return .white
          }
    }
    
    var background: UIColor {
        if #available(iOS 13.0, *) {
              return .tertiarySystemBackground
          } else {
              return .white
          }
    }
    
    var defaultButtonColor: UIColor {
        return UIColor(red:1.00, green:0.66, blue:0.00, alpha:1.0)
    }
}
