//
//  CollectionViewCell.swift
//  TestingDynamicTableViewDataSource
//
//  Created by Krishna Venkatramani on 05/07/2022.
//

import Foundation
import UIKit

//MARK: - Cell
class NumberCell:ConfigurableCollectionCell{
    
    private var label:UILabel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        label = UILabel()
        label?.textAlignment = .center
        label?.textColor = .white
        label?.font = .systemFont(ofSize: 12, weight: .medium)
        addViewAndSetFittingConstraints(label!, edges: .init(top: 5, left: 5, bottom: 5, right: 5))
        backgroundColor = .red
        layer.cornerRadius = 16
    }
    
    func configureCell(with model: TestCellData) {
        label?.text = "\(model.val)"
    }
    
    static var itemSize: CGSize{
		.init(width: 125, height: 42)
    }
}
