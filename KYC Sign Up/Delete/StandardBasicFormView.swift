//
//  StandardBasicFormView.swift
//  Koi Compliance
//
//  Created by Zach Chen on 2/27/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class StandardBasicFormView: UIView {
	
	// MARK: SET TARGETS, DELEGATES, AND DATA SOURCES
	var basicInformationViewController: BasicInformationViewController? {
		didSet {
			
			nationalityPicker.delegate = basicInformationViewController
			nationalityPicker.dataSource = basicInformationViewController
			
			usBasicInformationView.nextFunction()
			usBasicInformationView.basicInformationViewController = basicInformationViewController
		}
	}
	
	// MARK: CREATE UI OBJECTS
	
	// nationality
	let nationalityLabel = FormLabel()
	let nationalityTextField = FormTextField()
	let nationalityPicker = UIPickerView()
	let separator1 = BasicSeparator()
	
	// US basic information view
	let usBasicInformationView = BasicInformationView()
	
	func configureUIModifications() {
		
		// nationality
		nationalityLabel.text = NSLocalizedString("nationality", comment: "")
		nationalityTextField.placeholder = NSLocalizedString("nationalityPlaceholder", comment: "")
		nationalityTextField.inputView = nationalityPicker
		nationalityTextField.addDoneToolbar()
		
		// us biv
		usBasicInformationView.translatesAutoresizingMaskIntoConstraints = false
		usBasicInformationView.configureView()
		
	}
	
	// MARK: SET UP UI OBJECTS
	func configureView() {
		
		configureUIModifications()
		backgroundColor = .white
		let safeArea = safeAreaLayoutGuide
		
		// nationality
		addSubview(nationalityLabel)
		if #available(iOS 11.0, *) {
			nationalityLabel.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
			nationalityLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor).isActive = true
			nationalityLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor).isActive = true
		} else {
			nationalityLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
			nationalityLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
			nationalityLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
		}
		
		addSubview(nationalityTextField)
		nationalityTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		nationalityTextField.topAnchor.constraint(equalTo: nationalityLabel.bottomAnchor, constant: 10).isActive = true
		nationalityTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		addSubview(separator1)
		separator1.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator1.topAnchor.constraint(equalTo: nationalityTextField.bottomAnchor, constant: 10).isActive = true
		separator1.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator1.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		
		
		
		addSubview(usBasicInformationView)
		usBasicInformationView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		usBasicInformationView.topAnchor.constraint(equalTo: separator1.bottomAnchor, constant: 10).isActive = true
		usBasicInformationView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
		usBasicInformationView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
	}
	
	func configureUSBasicInformationView() {
		if (nationalityTextField.text == "United States") {
			addSubview(usBasicInformationView)
			usBasicInformationView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
			usBasicInformationView.topAnchor.constraint(equalTo: nationalityTextField.bottomAnchor, constant: 10).isActive = true
			usBasicInformationView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
		}
	}
}


// SomerandomPassword!
