//
//  FormTextField.swift
//  Koi Compliance
//
//  Created by Zach Chen on 2/20/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class FormTextField: UITextField, UITextFieldDelegate {
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		delegate = self
		styleTextField()
	}
	
	required override init(frame: CGRect) {
		super.init(frame: frame)
		delegate = self
		styleTextField()
	}
	
	func styleTextField() {
		
		// style
		self.autocorrectionType = .no
		self.autocapitalizationType = .none
		self.textAlignment = .left
		self.returnKeyType = .next
		self.translatesAutoresizingMaskIntoConstraints = false
		
		// layout
		
	}
	
	// MARK: TOOLBARS
	
	// functions
	func addDoneToolbar() {
		
		let toolbar = KoiToolbar()
		let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.resignFirstResponder))
		let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
		toolbar.setItems([flexible, doneButton], animated: false)
		
		self.inputAccessoryView = toolbar
	}
	
	func addAtComToolbar() {
		
		let toolBar = KoiToolbar()
		let atButton = UIBarButtonItem(title: "@", style: .plain, target: self, action: #selector(atSelected))
		let comButton = UIBarButtonItem(title: ".com", style: .plain, target: self, action: #selector(comSelected))
		let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
		toolBar.setItems([flexible, atButton, comButton], animated: false)
		
		self.inputAccessoryView = toolBar
	}
	
	// actions
	@objc func atSelected() {
		let textFieldText = self.text
		self.text = "\(textFieldText ?? "")@"
	}

	@objc func comSelected() {
		let textFieldText = self.text
		self.text = "\(textFieldText ?? "").com"
	}
	
	// MARK: PICKERS
	
	// functions
	func addDatePicker() {
		let datePicker = DateOfBirthPicker()
		datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
		
		self.inputView = datePicker
	}
	
	// actions
	@objc func dateChanged(_ sender: UIDatePicker) {
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .long
		self.text = dateFormatter.string(from: sender.date)
	}
	
}
