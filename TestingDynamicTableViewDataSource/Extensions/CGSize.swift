//
//  CGSize.swift
//  TestingDynamicTableViewDataSource
//
//  Created by Krishna Venkatramani on 13/07/2022.
//

import Foundation
import UIKit

extension CGSize {
	
	static func * (lhs:CGSize,rhs:CGFloat) -> Self { .init(width: lhs.width * rhs, height: lhs.height * rhs) }
	
	var halfed: CGSize { self * 0.5 }
	
}
