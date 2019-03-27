//
//  BasicSeparator.swift
//  Koi Compliance
//
//  Created by Zach Chen on 2/20/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class BasicSeparator: UIView {
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		styleSeparator()
	}
	
	required override init(frame: CGRect) {
		super.init(frame: frame)
		styleSeparator()
	}
		
	func styleSeparator() {
		
		// style
		self.backgroundColor = .black
		self.translatesAutoresizingMaskIntoConstraints = false
		
		// layout
//		self.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//		self.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
//		self.heightAnchor.constraint(equalToConstant: 1).isActive = true

	}
}
