//
//  CGF.swift
//  TestingDynamicTableViewDataSource
//
//  Created by Krishna Venkatramani on 13/07/2022.
//

import Foundation
import UIKit

extension CGFloat {
	
	static var totalwidth: CGFloat { UIScreen.main.bounds.width }
	
	func half() -> Self { self * 0.5 }
	
	func multiple(factor x: CGFloat) -> Self { self * x }
	
}
