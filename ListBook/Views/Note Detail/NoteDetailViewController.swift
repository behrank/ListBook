//
//  NoteDetailViewController.swift
//  ListBook
//
//  Created by Can Behran Kankul on 27.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit
import RealmSwift

class NoteDetailViewController: BaseViewController {
    lazy var titleLabel: UILabel = {
        var title = UILabel(frame: .zero)
        title.textColor = AppTheme.current.subTextColor
        title.text = "Name:"
        return title
    }()
    lazy var detailLabel: UILabel = {
        var title = UILabel(frame: .zero)
        title.textColor = AppTheme.current.subTextColor
        title.text = "Description:"
        return title
    }()
    lazy var addLabel: UILabel = {
        var title = UILabel(frame: .zero)
        title.textColor = AppTheme.current.subTextColor
        title.text = "Added Date:"
        return title
    }()
    lazy var nameField: LBTextField = {
        var txtField = LBTextField(frame: .zero)
        txtField.placeholder = "Title"
        txtField.backgroundColor = .groupTableViewBackground
        txtField.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        
        txtField.addRadius()
        return txtField
    }()
    
    lazy var descField: LBTextView = {
        var txtView = LBTextView(frame: .zero)
        txtView.backgroundColor = .groupTableViewBackground
        txtView.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.semibold)
        txtView.addRadius()
        
        txtView.textContainerInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        return txtView
    }()
    lazy var addDateLabel: UILabel = {
        var timeLabel = UILabel(frame: .zero)
        timeLabel.textColor = AppTheme.current.subTextColor
        return timeLabel
    }()
    
    lazy var continueButton: LBButton = {
        var button = LBButton()
        button.setTitle("Save", for: UIControl.State.normal)
        button.backgroundColor = AppTheme.current.buttonBackgroundColor
        button.addRadius()
        return button
    }()
    
    private var currentNote: Note? {
        didSet {
            if let currentNote = currentNote {
                nameField.text = currentNote.name
                descField.text = currentNote.noteDetail
                addDateLabel.text = currentNote.convertAddDateToString()
            }
        }
    }
    
    override func setupUI() {
        super.setupUI()
        view.backgroundColor = AppTheme.current.collectionCellBackground
        view.addSubviews(views: titleLabel, nameField, detailLabel, descField, addLabel, addDateLabel, continueButton)
        view.addConstraintsWithFormat(format: "V:|-16-[v0]-4-[v1]-16-[v2]-4-[v3]-16-[v4]-4-[v5]-64-[v6]", views: titleLabel, nameField, detailLabel, descField, addLabel, addDateLabel, continueButton)
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: titleLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: nameField)
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: detailLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: descField)
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: addLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: addDateLabel)
        
        titleLabel.addHeight(20)
        detailLabel.addHeight(20)
        addLabel.addHeight(20)
        nameField.addHeight(40)
        descField.addHeight(100)
        addDateLabel.addHeight(20)
        continueButton.alignCenterVerticalyToSuperview()
        continueButton.addHeight(40)
        continueButton.addWidth(200)
        
        continueButton.addTarget(self, action: #selector(validateAndUpdateNewNote), for: UIControl.Event.touchDown)
        
        setupNavigationBar()
    }
    
    func setViewData(viewData: Note) {
        currentNote = viewData
        navigationItem.title = currentNote?.name
    }
    
    private func setupNavigationBar() {
        let removeNotebutton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.trash, target: self, action: #selector(removeNote))
        navigationItem.rightBarButtonItems = [removeNotebutton]
    }
}
// MARK: Actions
extension NoteDetailViewController {
    
    @objc private func removeNote() {
        
        if  let currentNote = currentNote {
            let realm = try! Realm()
            
            try! realm.write {
                realm.delete(currentNote)
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc private func validateAndUpdateNewNote() {
        continueButton.displayLoading()
        nameField.validateEntry()
        descField.validateEntry()
        
        if nameField.isValid() && descField.isValid() {
            
            if let nameStr = nameField.text, let currentNote = currentNote {
                let realm = try! Realm()
                
                try! realm.write {
                    currentNote.name = nameStr
                    currentNote.noteDetail = self.descField.text
                    currentNote.updateInterval = Note.generateDate()
                    realm.add(currentNote)
                }
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            continueButton.hideLoading()
        }
    }
}

