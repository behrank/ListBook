//
//  NotesCollectioViewController.swift
//  ListBook
//
//  Created by Can Behran Kankul on 25.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

class NoteListCollectionViewController: BaseCollectionViewController {
    
    private var dataSource: NoteListDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = NoteListDataSource(object: Note.self, collectionView: collectionView)
        
        collectionView?.register(NoteCollectionViewCell.self, forCellWithReuseIdentifier: "\(NoteCollectionViewCell.self)")
        collectionView?.dataSource = dataSource
        collectionView?.backgroundColor = AppTheme.current.collectionViewBackground
        collectionView?.delegate = self
        setupNavigationBar()
    }
}
// MARK: Navigation Bar
extension NoteListCollectionViewController {
    private func setupNavigationBar() {
        let addNotebutton = UIBarButtonItem(title: "Add", style: UIBarButtonItem.Style.plain, target: self, action: #selector(toggleNewNoteUI))
        navigationItem.rightBarButtonItems = [addNotebutton]
    }
    @objc private func toggleNewNoteUI() {
        let modal = NewNoteModalView()
        modal.toggleModal()
    }
}
// MARK: CollectionView cell
extension NoteListCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}

