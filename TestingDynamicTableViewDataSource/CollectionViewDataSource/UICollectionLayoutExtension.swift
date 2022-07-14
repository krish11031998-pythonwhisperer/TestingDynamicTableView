//
//  UICollectionLayoutExtension.swift
//  TestingDynamicTableViewDataSource
//
//  Created by Krishna Venkatramani on 10/07/2022.
//

import Foundation
import UIKit

extension UICollectionViewFlowLayout {
	
	static var standardFlow: UICollectionViewFlowLayout {
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = .init(width: 175, height: 200)
		layout.scrollDirection = .horizontal
		layout.sectionInset = .init(top: 0, left: 25, bottom: 0, right: 25)
		layout.minimumInteritemSpacing = 0
		layout.minimumLineSpacing = 10
		return layout
	}
	
	
	static var standardHGridFlow: UICollectionViewFlowLayout {
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = .init(width: 135, height: 250)
		layout.scrollDirection = .horizontal
		layout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)
		layout.minimumInteritemSpacing = 0
		layout.minimumLineSpacing = 24
		return layout
	}
	
	static var standardVGridFlow: UICollectionViewFlowLayout {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		layout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)
		layout.minimumInteritemSpacing = 10
		layout.minimumLineSpacing = 24
		layout.itemSize = .init(width: .totalwidth.half() - layout.minimumInteritemSpacing.multiple(factor: 2), height: 250)
		return layout
	}
	
}
