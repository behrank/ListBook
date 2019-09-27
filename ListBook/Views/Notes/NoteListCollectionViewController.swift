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
    private var collectionViewDelegate: NoteListDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = NoteListDataSource(object: Note.self, collectionView: collectionView)
        collectionViewDelegate = NoteListDelegate()
        collectionViewDelegate?.delegate = self
        
        collectionView?.register(NoteCollectionViewCell.self, forCellWithReuseIdentifier: "\(NoteCollectionViewCell.self)")
        collectionView?.dataSource = dataSource
        collectionView?.backgroundColor = AppTheme.current.collectionViewBackground
        collectionView?.delegate = collectionViewDelegate
        setupNavigationBar()
    }
}
// MARK: Navigation Bar
extension NoteListCollectionViewController {
    private func setupNavigationBar() {
        let addNotebutton = UIBarButtonItem(title: "Add", style: UIBarButtonItem.Style.plain, target: self, action: #selector(toggleNewNoteUI))
        navigationItem.rightBarButtonItems = [addNotebutton]
        navigationItem.title = Bundle.main.displayName
    }
    @objc private func toggleNewNoteUI() {
        let modal = NewNoteModalView()
        modal.toggleModal()
    }
}

// MARK: CollectionView Action Delegate
extension NoteListCollectionViewController: CollectionViewActionDelegate {
    func didTapCellAt(indexPath: IndexPath) {
        if let tappedCellObject = dataSource?.getObjectAt(index: indexPath.row) as? Note {
            let nextVc = NoteDetailViewController()
            nextVc.setViewData(viewData: tappedCellObject)
            navigationController?.pushViewController(nextVc, animated: true)
        }
    }
}

