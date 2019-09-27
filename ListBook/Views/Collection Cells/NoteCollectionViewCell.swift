//
//  NoteCollectionViewCell.swift
//  ListBook
//
//  Created by Can Behran Kankul on 26.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit
import RealmSwift

class NoteCollectionViewCell: UICollectionViewCell {
    
    lazy var titleLabel: UILabel = {
        var title = UILabel(frame: .zero)
        title.textColor = AppTheme.current.textColor
        return title
    }()
    
    lazy var addDateLabel: UILabel = {
        var timeLabel = UILabel(frame: .zero)
        timeLabel.textColor = AppTheme.current.subTextColor
        return timeLabel
    }()
    
    func setup(cellData: Note) {
        contentView.addSubviews(views: titleLabel, addDateLabel)
        
        contentView.addConstraintsWithFormat(format: "V:|-8-[v0]-4-[v1]", views: titleLabel,addDateLabel)
        contentView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: titleLabel)
        contentView.addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: addDateLabel)
        
        addDateLabel.addHeight(20)
    }
}
