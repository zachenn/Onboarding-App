//
//  FormLabel.swift
//  Koi Compliance
//
//  Created by Zach Chen on 2/21/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class FormLabel: UILabel {
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		styleLabel()
	}
	
	required override init(frame: CGRect) {
		super.init(frame: frame)
		styleLabel()
	}
	
	private func styleLabel() {
		
		// style
//		let attributes: NSDictionary = [
//			NSAttributedString.Key.font:UIFont(name: "Roboto-Regular", size: 14)!,
//			NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.9) /* #ffffff */,
//			NSAttributedString.Key.kern:CGFloat(2.0)
//		]
//		let attributedTitle = NSAttributedString(string: "welcome back", attributes: attributes as? [NSAttributedString.Key : AnyObject])
//		self.attributedText = attributedTitle
		self.font = UIFont.boldSystemFont(ofSize: 16)
		self.textAlignment = .left
		self.numberOfLines = 0
		self.translatesAutoresizingMaskIntoConstraints = false
	}
}
