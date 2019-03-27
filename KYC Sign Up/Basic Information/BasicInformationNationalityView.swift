//
//  BasicInformationNationalityView.swift
//  Koi Compliance
//
//  Created by Zach Chen on 3/4/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class BasicInformationNationalityView: UIView {
	
	var basicInformationViewController: BasicInformationViewController? {
		didSet {
			
			// delegates
			nationalityPicker.delegate = basicInformationViewController
			nationalityPicker.dataSource = basicInformationViewController
			
		}
	}
	
	// MARK: CREATE UI OBJECTS
	
	// nationality
	let nationalityLabel = FormLabel()
	let nationalityTextField = FormTextField()
	let nationalityPicker = UIPickerView()
	let separator1 = BasicSeparator()
	
	// MARK: SET UP UI OBJECTS
	private func configureUIModifications() {
		
		// background
		backgroundColor = .white
		
		// nationality
		nationalityLabel.text = NSLocalizedString("nationality", comment: "")
		nationalityTextField.placeholder = NSLocalizedString("nationalityPlaceholder", comment: "")
		nationalityTextField.inputView = nationalityPicker
		nationalityTextField.addDoneToolbar()
	}
	
	func configureView() {
		
		configureUIModifications()
		let safeArea = safeAreaLayoutGuide
		
		// nationality
		addSubview(nationalityLabel)
		if #available(iOS 11.0, *) {
			nationalityLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
			nationalityLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10).isActive = true
			nationalityLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor, constant: -30).isActive = true
		} else {
			nationalityLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
			nationalityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
			nationalityLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
		}
		
		addSubview(nationalityTextField)
		nationalityTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		nationalityTextField.topAnchor.constraint(equalTo: nationalityLabel.bottomAnchor, constant: 10).isActive = true
		nationalityTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
		
		// separator 1
		addSubview(separator1)
		separator1.topAnchor.constraint(equalTo: nationalityTextField.bottomAnchor, constant: 10).isActive = true
		separator1.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
		separator1.widthAnchor.constraint(equalTo: widthAnchor, constant: -15).isActive = true
		separator1.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
	}
	
	// add the basic information fields after a country is selected
	func addNewView(tableView: BasicInformationTableView) {

		// add view based on which country was chosen
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		addSubview(tableView)
		tableView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		tableView.topAnchor.constraint(equalTo: separator1.bottomAnchor, constant: 10).isActive = true
		tableView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
	}
}
