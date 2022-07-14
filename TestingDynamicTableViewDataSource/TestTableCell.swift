//
//  TestTableCell.swift
//  TestingDynamicTableViewDataSource
//
//  Created by Krishna Venkatramani on 05/07/2022.
//

import Foundation
import UIKit

struct TestCellData:ActionProvider{
    let val:Int
    let action: Callback?
}

class TestTableCell:ConfigurableCell{
    
    private var label:UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        label = UILabel()
        label?.font = .systemFont(ofSize: 15, weight: .medium)
    }
    
    func viewBuilder(){
		guard let validLabel = label else { return }
		let view = UIView()
		addViewAndSetFittingConstraints(view,edges: .init(top: 0, left: 10, bottom: 0, right: 10))
		view.addViewAndSetFittingConstraints(validLabel,edges: .init(top: 10, left: 10, bottom: 10, right: 10))
        NSLayoutConstraint.activate([
			view.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    func configureCell(with model: TestCellData) {
        label?.text = "\(model.val)"
		viewBuilder()
        switch(model.val + 1)%3 {
        case 0:
			setColorCell(.red)
        case 1:
			setColorCell(.green)
        case 2:
			setColorCell(.blue)
        default:
			setColorCell(.clear)
        }
		
    }
    
    
    func setColorCell(_ color:UIColor){
        guard let firstView = subviews.first else {return}
        firstView.backgroundColor = color
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
		subviews.forEach { $0.removeFromSuperview() }
    }
}
