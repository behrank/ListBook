//
//  NoteListDelegate.swift
//  ListBook
//
//  Created by Can Behran Kankul on 27.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

class NoteListDelegate: BaseCollectionViewDelegate, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTapCellAt(indexPath: indexPath)
    }
}

// MARK: CollectionView cell
extension NoteListDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}
