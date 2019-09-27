//
//  NewNoteModalView.swift
//  ListBook
//
//  Created by Can Behran Kankul on 26.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit
import RealmSwift

class NewNoteModalView: UIView {
    
    lazy var wrapperView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = AppTheme.current.wrapperBackground
        view.alpha = 0
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = AppTheme.current.background
        view.alpha = 0
        view.addRadius()
        return view
    }()
    
    lazy var closeImage: UIImageView = {
        var imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "close")
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        var title = UILabel(frame: .zero)
        title.textColor = AppTheme.current.textColor
        title.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        title.text = "New Note"
        title.textAlignment = NSTextAlignment.center
        return title
    }()
    
    lazy var nameField: LBTextField = {
        var txtField = LBTextField(frame: .zero)
        txtField.placeholder = "Title"
        txtField.backgroundColor = .groupTableViewBackground
        txtField.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        
        txtField.addRadius()
        return txtField
    }()
    
    lazy var descField: LBTextView = {
        var txtView = LBTextView(frame: .zero)
        txtView.backgroundColor = .groupTableViewBackground
        txtView.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.semibold)
        txtView.addRadius()
    
        txtView.textContainerInset = UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
        return txtView
    }()
    
    lazy var detailLabel: UILabel = {
        var title = UILabel(frame: .zero)
        title.textColor = AppTheme.current.subTextColor
        title.text = "Description"
        title.font = UIFont.systemFont(ofSize: 14)
        return title
    }()
    
    lazy var continueButton: LBButton = {
        var button = LBButton()
        button.setTitle("Save", for: UIControl.State.normal)
        button.backgroundColor = AppTheme.current.buttonBackgroundColor
        button.addRadius()
        return button
    }()
    
    func toggleModal() {
        
        if self.contentView.alpha == 1 {
            UIView.animate(withDuration: 0.2, animations: {
                self.wrapperView.alpha = 0
                self.contentView.alpha = 0

            }) { (isDone) in
                if isDone {
                    self.continueButton.hideLoading()
                    self.removeFromSuperview()
                }
            }
            return
        }
        backgroundColor = .clear
        
        addToSuperView()
        addSubs()
        addTextUI()
        addButton()
        
        UIView.animate(withDuration: 0.2) {
            self.wrapperView.alpha = 0.5
            self.contentView.alpha = 1
        }
    }
    
    private func addToSuperView() {
        guard let window = UIApplication.shared.keyWindow else { return }
        window.addSubview(self)
        window.bringSubviewToFront(self)
        window.addConstraintsWithFormat(format: "H:|[v0]|", views: self)
        window.addConstraintsWithFormat(format: "V:|[v0]|", views: self)
    }
    
    private func addSubs() {
        addSubviews(views: wrapperView, contentView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: wrapperView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: wrapperView)
        
        contentView.addWidth(250)
        contentView.addHeight(270)
        
        contentView.alignCenterHorizontalyToSuperview()
        contentView.alignCenterVerticalyToSuperview()
        
        contentView.addSubviews(views: titleLabel)
        contentView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: titleLabel)
        contentView.addConstraintsWithFormat(format: "V:|-16-[v0]", views: titleLabel)
        
        titleLabel.addHeight(20)
        
        let gestureRec = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        wrapperView.addGestureRecognizer(gestureRec)
        wrapperView.isUserInteractionEnabled = true
    }
    private func addTextUI() {
        contentView.addSubviews(views: nameField, detailLabel, descField)
        contentView.addConstraintsWithFormat(format: "V:[v0]-16-[v1]-8-[v2]-4-[v3]", views: titleLabel, nameField, detailLabel, descField)
        contentView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: nameField)
        contentView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: detailLabel)
        contentView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: descField)
        
        detailLabel.addHeight(20)
        nameField.addHeight(40)
        descField.addHeight(90)
    }
    private func addButton() {
        contentView.addSubviews(views: continueButton)
        contentView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: continueButton)
        contentView.addConstraintsWithFormat(format: "V:[v0]-8-|", views: continueButton)
        
        continueButton.addHeight(40)
        continueButton.addTarget(self, action: #selector(validateAndSaveNewNote), for: UIControl.Event.touchDown)
        
        contentView.addSubviews(views: closeImage)
        contentView.addConstraintsWithFormat(format: "H:[v0]-8-|", views: closeImage)
        contentView.addConstraintsWithFormat(format: "V:|-8-[v0]", views: closeImage)
        
        closeImage.addWidth(20)
        closeImage.addHeight(20)
        
        let gestureRec = UITapGestureRecognizer(target: self, action: #selector(closeModal))
        closeImage.addGestureRecognizer(gestureRec)
        closeImage.isUserInteractionEnabled = true
    }
}
extension NewNoteModalView {
    @objc private func validateAndSaveNewNote() {
        continueButton.displayLoading()
        nameField.validateEntry()
        descField.validateEntry()
        
        if nameField.isValid() && descField.isValid() {
            
            if let nameStr = nameField.text {
                let newNote = Note.create(name: nameStr, description: descField.text)

                let realm = try! Realm()
                
                try! realm.write {
                    realm.add(newNote)
                }
                self.closeModalWithInterval()
            }
        } else {
            continueButton.hideLoading()
        }
    }
    @objc private func closeModalWithInterval(time: Int = 1) {
        
        nameField.text = ""
        descField.text = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(time), execute: {
            self.toggleModal()
        })
    }
    @objc private func closeModal() {
            self.toggleModal()
       }
    @objc func closeKeyboard() {
        self.endEditing(true)
    }
}
