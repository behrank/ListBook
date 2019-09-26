//
//  ViewController.swift
//  ListBook
//
//  Created by Can Behran Kankul on 25.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

class LandingViewController: BaseViewController {

    lazy var logoImageView: UIImageView = {
        var imgView = UIImageView(frame: .zero)
        imgView.image = UIImage(named: "icon")
        return imgView
    }()
    
    lazy var continueButton: UIButton = {
        var button = UIButton(frame: .zero)
        button.backgroundColor = AppTheme.current.defaultButtonColor
        button.setTitle("Continue", for: UIControl.State.normal)
        button.titleLabel?.textColor = AppTheme.current.textColor
        return button
    }()
    
    override func setupUI() {
        super.setupUI()
        
        view.addSubviews(views: logoImageView, continueButton)
        
        view.addConstraintsWithFormat(format: "V:|-144-[v0]", views: logoImageView)
        logoImageView.addHeight(128)
        logoImageView.addWidth(128)
        logoImageView.alignCenterVerticalyToSuperview()
        
        view.addConstraintsWithFormat(format: "V:[v0]-64-|", views: continueButton)
        continueButton.addWidth(200)
        continueButton.addHeight(44)
        continueButton.addRadius()
        continueButton.addTarget(self, action: #selector(continueToNextScene), for: .touchUpInside)
        continueButton.alignCenterVerticalyToSuperview()
    }
    
    @objc private func continueToNextScene() {
        navigationController?.pushViewController(Controller.notes.asViewController, animated: true)
    }
}

