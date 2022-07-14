//
//  CollectionViewCell.swift
//  TestingDynamicTableViewDataSource
//
//  Created by Krishna Venkatramani on 05/07/2022.
//

import Foundation
import UIKit


class CollectionViewTableCell:ConfigurableCell{

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
	func configureCell(with model: CollectionDataSource) {
		let collection = UICollectionView(frame: .zero,collectionViewLayout: .init())
		contentView.addSubview(collection)
		contentView.setConstraintsFitting(child: collection,edges: .zero)
		collection.reload(with: model)
	}
    
}
