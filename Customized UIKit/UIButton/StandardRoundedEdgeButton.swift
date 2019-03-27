//
//  StandardRoundedEdgeButton.swift
//  Koi Compliance
//
//  Created by Zach Chen on 3/5/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class StandardRoundedEdgeButton: UIButton {
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		styleStandardRoundedEdgeButton()
	}
	
	required override init(frame: CGRect) {
		super.init(frame: frame)
		styleStandardRoundedEdgeButton()
	}
	
	func styleStandardRoundedEdgeButton() {
		self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
		self.setTitleColor(UIColor.black, for: .normal)
		self.setTitleColor(UIColor.black.withAlphaComponent(0.5), for: .highlighted)
		self.reversesTitleShadowWhenHighlighted = true
		self.layer.cornerRadius = 20
		self.layer.borderWidth = 1
		self.layer.borderColor = UIColor.black.cgColor
		self.layer.masksToBounds = true
		self.translatesAutoresizingMaskIntoConstraints = false
	}
}
