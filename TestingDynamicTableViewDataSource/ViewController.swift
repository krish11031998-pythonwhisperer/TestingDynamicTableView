//
//  ViewController.swift
//  TestingDynamicTableViewDataSource
//
//  Created by Krishna Venkatramani on 29/06/2022.
//

import UIKit

class ViewController: UIViewController {

	private var tableView:UITableView? = nil
	private lazy var datasource:TableViewDataSource = { buildDatasource() }()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		setupUI()
		buildNavbar()
		tableView?.reload(with: buildDatasource())
	}
	
	func buildNavbar(){
		navigationController?.isNavigationBarHidden = true
	}
	
	func setupUI(){
		tableView = UITableView(frame: .zero,style: .grouped)
		view.addViewAndSetFittingConstraints(tableView!)
		tableView?.separatorStyle = .none
		tableView?.backgroundColor = .white
	}
	
	private func buildDatasource() -> TableViewDataSource{
		.init(section: [section, sectionTwo].compactMap{$0})
	}
	    
    private var section:TableCollectionSection? {
        let data:[TestCellData] = (0...20).map { val in .init(val: val, action: {
                print("(DEBUG) Clicked on : \(val)")
            })}
        let cols = data.map(CollectionColumn<NumberCell>.init)
        
		return .init(headerView: headerViewForSection("Hello,There"),columns: cols,layout: .standardVGridFlow, height: 550)
    }
	
	private var sectionTwo:TableSection? {
		let row = (0...20).map { val in
			return TableRow<TestTableCell>(.init(val: val, action: {
				print("(DEBUG) Clicked on : \(val)")
			}))
		}
		return .init(headerView:headerViewForSection("Hello,There Again"),rows: row)
	}
	
	private func headerViewForSection(_ title:String) -> UIView{
		let view = UIView(frame: .init(origin: .zero, size: .init(width: UIScreen.main.bounds.width, height: 50)))
		let label = UILabel()
		label.text = title
		label.font = .systemFont(ofSize: 18, weight: .bold)
		view.addViewAndSetFittingConstraints(label, edges: .init(top: 5, left: 15, bottom: 5, right: 1))
		view.backgroundColor = .white
		return view
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
			print("(DEBUG) Reloading the table!")
			self.tableView?.reload(with: self.buildDatasource())
		}
	}
	
	
}


