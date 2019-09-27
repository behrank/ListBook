//
//  BookListDataSource.swift
//  ListBook
//
//  Created by Can Behran Kankul on 26.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit
import RealmSwift

class NoteListDataSource: BaseDataSource, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getObjectCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(NoteCollectionViewCell.self)", for: indexPath)
        
        if let currentCell = cell as? NoteCollectionViewCell, let cellData =  getObjectAt(index: indexPath.row) as? Note {
            currentCell.setup(cellData: cellData)
            return currentCell
        }
        return cell
    }
}
