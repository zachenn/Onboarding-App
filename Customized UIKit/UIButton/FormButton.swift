//
//  FormButton.swift
//  Koi Compliance
//
//  Created by Zach Chen on 2/25/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class FormButton: UIButton {
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		styleFormButton()
	}
	
	required override init(frame: CGRect) {
		super.init(frame: frame)
		styleFormButton()
	}
	
	func styleFormButton() {
		
//		self.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 12)
		self.contentHorizontalAlignment = .left
		self.setTitleColor(.black, for: .normal)
		self.setTitleColor(UIColor.black.withAlphaComponent(0.5), for: .highlighted)
		self.translatesAutoresizingMaskIntoConstraints = false
	}
}
