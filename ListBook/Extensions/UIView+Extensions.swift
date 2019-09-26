//
//  UIView.swift
//  ListBook
//
//  Created by Can Behran Kankul on 25.09.2019.
//  Copyright © 2019 Can Behran Kankul. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Adds views to superview with single command
    ///
    /// - Parameter views: UIView and its subclasses
    func addSubviews(views:UIView...) {
        
        var viewsDic = [String : UIView]()
        
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDic[key] = view
            self.addSubview(view)
        }
    }
    /// Adds constraints with visual format (String)
    ///
    /// - Parameter format: String
    /// - Parameter views: UIView and its subclasses
    func addConstraintsWithFormat(format:String,views:UIView...) {
        
        var viewsDic = [String : UIView]()
        
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDic[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDic))
    }
    
    func addWidth(_ value:Int) {
        addConstraintsWithFormat(format: "H:[v0(\(value))]", views: self)
    }
    
    func addHeight(_ value:Int) {
        addConstraintsWithFormat(format: "V:[v0(\(value))]", views: self)
    }
    
    func alignCenterVerticalyToSuperview() {
        
        if let superView = self.superview {
            superView.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: superView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0))
        }
    }
    
    func alignCenterHorizontalyToSuperview() {
        
        if let superView = self.superview {
            superView.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: superView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0))
        }
    }
    
    func alignCenterToSuperView() {
        if let superView = self.superview {
            superView.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: superView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0))
            superView.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: superView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0))
        }
    }
    
    /// Adds view to its super view with 16px spacing
    ///
    /// - Parameter view: UIView, UICollectionViewCell, UITableViewCell
    func attachViewWithDefaultMarginTo(view:UIView){
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: self)
        view.addConstraintsWithFormat(format: "V:|-16-[v0(\(16))]", views: self)
    }
    
    /// Adds input view to its super view after a view with 16px spacing
    ///
    /// - Parameter after: UIView
    /// - Parameter inView: UIView, UICollectionViewCell, UITableViewCell
    func attachToView(after:UIView,inView:UIView){
        inView.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: self)
        inView.addConstraintsWithFormat(format: "V:[v0]-16-[v1(\(16))]", views: after, self)
    }
    
    func setWidthEqualToSuperview() {
        if let superView = self.superview {
            superView.addConstraintsWithFormat(format: "H:|[v0]|", views: self)
        }
    }
    
    func setHeightEqualToSuperview() {
        if let superView = self.superview {
            superView.addConstraintsWithFormat(format: "V:|[v0]|", views: self)
        }
    }
    func dropShadow() {
        layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    func addRadius(radius: CGFloat = 8.0) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
