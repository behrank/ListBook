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
        title.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.regular)
        return title
    }()
    
    lazy var addDateLabel: UILabel = {
        var timeLabel = UILabel(frame: .zero)
        timeLabel.textColor = AppTheme.current.subTextColor
        return timeLabel
    }()
    
    func setup(cellData: Note) {
        contentView.backgroundColor = AppTheme.current.collectionCellBackground
        contentView.addSubviews(views: titleLabel, addDateLabel)
        contentView.addConstraintsWithFormat(format: "V:|-16-[v0]-4-[v1]", views: titleLabel,addDateLabel)
        contentView.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: titleLabel)
        contentView.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: addDateLabel)

        addDateLabel.addHeight(20)
        
        titleLabel.text = cellData.name
        if cellData.addInterval == cellData.updateInterval {
            addDateLabel.text = cellData.convertAddDateToString()
        } else {
            addDateLabel.text = "Updated: \(cellData.convertUpdateDateToString())"
        }
    }
}
