//
//  DateOfBirthPicker.swift
//  Koi Compliance
//
//  Created by Zach Chen on 2/25/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class DateOfBirthPicker: UIDatePicker {
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		styleDatePicker()
	}
	
	required override init(frame: CGRect) {
		super.init(frame: frame)
		styleDatePicker()
	}
	
	func styleDatePicker() {
		
		// style
		self.datePickerMode = .date
		self.date = Date.init(timeIntervalSinceReferenceDate: 0)
	}
}
