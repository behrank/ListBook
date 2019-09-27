//
//  BaseDataSource.swift
//  ListBook
//
//  Created by Can Behran Kankul on 26.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit
import RealmSwift

class BaseDataSource: NSObject {
    
    private var notificationToken: NotificationToken? = nil
    private var listOfObjects: Results<Object>?
    private var currentCollectionView: UICollectionView?
    
    init(object: Object.Type, collectionView: UICollectionView) {
        super.init()
        
        currentCollectionView = collectionView
        
        fetchObjects(for: object)
        setupDataSource()
    }
    
    func getObjectCount() -> Int {
        return listOfObjects?.count ?? 0
    }
    
    func getObjectAt(index: Int) -> Object? {
        if let object = listOfObjects?[index] {
            return object
        }
        return nil
    }
}
// MARK: Private functions
extension BaseDataSource {
    private func fetchObjects(for object: Object.Type) {
        let realm = try! Realm()
        listOfObjects = realm.objects(object.self).sorted(byKeyPath: "updateInterval", ascending: false)
    }
    private func setupDataSource() {
        
        guard let listOfNotes = listOfObjects else {
            return
        }
        
        // Observe Results Notifications
        notificationToken = listOfNotes.observe { [weak self] (changes: RealmCollectionChange) in
            guard let collectionView = self?.currentCollectionView else { return }
            switch changes {
            case .initial:
                DispatchQueue.main.async {
                    collectionView.reloadData()
                    Logger.info(message: "CollectionView data source initialized")
                }
            case .update(_, let deletions, let insertions, let modifications):
                DispatchQueue.main.async {
                    collectionView.deleteItems(at: deletions.map({ IndexPath(row: $0, section: 0)}))
                    collectionView.insertItems(at: insertions.map({ IndexPath(row: $0, section: 0)}))
                    collectionView.reloadItems(at: modifications.map({ IndexPath(row: $0, section: 0)}))
                    Logger.info(message: "CollectionView updated")
                }
            case .error(let error):
                Logger.info(message: "\(error)")
            }
        }
    }
}
