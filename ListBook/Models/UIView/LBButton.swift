//
//  LBButton.swift
//  ListBook
//
//  Created by Can Behran Kankul on 27.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

class LBButton: UIButton {
    
    lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(frame: .zero)
        indicator.startAnimating()
        indicator.style = .white
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    func displayLoading() {
        setTitleColor(.clear, for: UIControl.State.normal)
        addSubviews(views: indicator)
        indicator.addHeight(20)
        indicator.addWidth(20)
        indicator.alignCenterToSuperView()
    }
    func hideLoading() {
        indicator.stopAnimating()
        setTitleColor(.white, for: UIControl.State.normal)
    }
}
