//
//  StandardTextView.swift
//  Koi Compliance
//
//  Created by Zach Chen on 3/5/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class StandardTextView: UITextView {
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
	}
	
	func updateHeight() {
		
		var newFrame = frame
		
		let fixedWidth = frame.size.width
		let newSize = sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
		
		newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
		self.frame = newFrame
	}
}
