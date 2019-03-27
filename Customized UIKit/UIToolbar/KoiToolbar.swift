//
//  KoiToolbar.swift
//  Koi Compliance
//
//  Created by Zach Chen on 2/22/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class KoiToolbar: UIToolbar {

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		styleToolbar()
	}
	
	required override init(frame: CGRect) {
		super.init(frame: frame)
		styleToolbar()
	}
	
	func styleToolbar() {
		
		// style
		self.barStyle = .default
		self.isTranslucent = true
		self.isUserInteractionEnabled = true
		self.sizeToFit()
//		self.tintColor = UIColor(red: 0.0275, green: 0.5725, blue: 0.5725, alpha: 1.0) /* #079292 */
		
		// items
//		let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneSelected))
//		let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
//		self.setItems([flexible, doneButton], animated: false)
	}
	
//	@objc func doneSelected(textFields: [UITextField]) {
//		
//		var i = 0
//		while (i < textFields.count) {
//			if (textFields[i].isFirstResponder) {
//				textFields[i].resignFirstResponder()
//				i = textFields.count
//			} else {
//				i += 1
//			}
//		}
//	}
}
