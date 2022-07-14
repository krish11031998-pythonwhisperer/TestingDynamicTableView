//
//  Heloers.swift
//  TestingDynamicTableViewDataSource
//
//  Created by Krishna Venkatramani on 05/07/2022.
//

import Foundation
import UIKit


extension UIView{
    
    func addViewAndSetFittingConstraints(_ child:UIView,edges:UIEdgeInsets = .zero){
        addSubview(child)
        child.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.leadingAnchor.constraint(equalTo: leadingAnchor,constant: edges.left),
            child.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -edges.right),
            child.topAnchor.constraint(equalTo: topAnchor, constant: edges.top),
            child.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -edges.bottom)
        ])
    }
    
    func setConstraintsFitting(child: UIView, edges: UIEdgeInsets = .zero) {
        let views = ["c" : child]
        let hQuery = "H:|-(\(edges.left))-[c]-(\(edges.right))-|"
        let vQuery = "V:|-(\(edges.top))-[c]-(\(edges.bottom))-|"
        let items = NSLayoutConstraint.constraints(withVisualFormat: hQuery, metrics: nil, views: views) +
            NSLayoutConstraint.constraints(withVisualFormat: vQuery, metrics: nil, views: views)
        
        child.translatesAutoresizingMaskIntoConstraints = false
//        removeConstraintsLike(items)
        addConstraints(items)
    }
    
}
