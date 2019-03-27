//
//  BasicInformationDataSource.swift
//  Koi Compliance
//
//  Created by Zach Chen on 2/28/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class BasicInformationDataSource: NSObject {
	
	var basicInformationTitleFields = [String]()
	var basicInformationCellType = [String]()
	var basicInformationPlaceholderFields = [String]()
	var basicInformationTag = [String: Int]()
	
	var pickerTextFieldOwner: UITextField?
	
	var countryPicker: UIPickerView?
	var basicInformationViewController: BasicInformationViewController? {
		didSet {
			countryPicker = UIPickerView()
			countryPicker!.delegate = basicInformationViewController
			countryPicker!.dataSource = basicInformationViewController
		}
	}
}

extension BasicInformationDataSource: UITableViewDataSource, UITextFieldDelegate {
	
	// MARK: GRAB INFORMATION FROM JSON
	
	// read JSON file
	func getBasicInformationList(country: String) {
		
		let url = Bundle.main.url(forResource: "Basic Information", withExtension: "json") // store a reference to the file location
		let data = try? Data(contentsOf: url!) // grab the data
		
		do { // do-catch b/c json serialization can fail
			let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
			if let dictionary = object as? [String: Any] {// [String: String] {
				readJSONObject(object: dictionary, country: country)
				
			}
		} catch {
			// Handle Error
		}
	}
	
	func readJSONObject(object: [String: Any], country: String) {
		if let basicInformationTitles = object["\(country) Basic Information Titles"] as? [[String]],
			let basicInformationCellTypes = object["\(country) Cell Types"] as? [[String]],
			let basicInformationPlaceholders = object["\(country) Basic Information Placeholders"] as? [[String]] {
			
			var titles = [String]()
			var cellTypes = [String]()
			var placeholders = [String]()
			
			// titles
			for field in basicInformationTitles {
				for rowItem in field {
					titles.append(rowItem)
				}
			}
			
			// form types
			for field in basicInformationCellTypes {
				for rowItem in field {
					cellTypes.append(rowItem)
				}
			}
			
			// placeholders
			for field in basicInformationPlaceholders {
				for rowItem in field {
					placeholders.append(rowItem)
				}
			}
			
			// add titles and placeholders to the local array
			basicInformationTitleFields = titles
			basicInformationCellType = cellTypes
			basicInformationPlaceholderFields = placeholders
		}
	}
	
	// MARK: SETUP TABLE
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return basicInformationTitleFields.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let title = basicInformationTitleFields[indexPath.row]
		let placeholder = basicInformationPlaceholderFields[indexPath.row]
		
		// set up cells contents based on cell type
		switch (basicInformationCellType[indexPath.row]) {
			
			// set up cell contents for textField cells
		case ("textField"):
			let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCollectionCell", for: indexPath) as! InformationCollectionCell
			
			cell.titleLabel.text = NSLocalizedString(title, comment: "")
			cell.textField.placeholder = NSLocalizedString(placeholder, comment: "")
			cell.textField.delegate = self
			cell.textField.tag = indexPath.row + 100 // for enabling the next function
			
			basicInformationTag[cell.titleLabel.text!] = cell.textField.tag
			
			// customize text fields
			switch (cell.titleLabel.text) {
			case (NSLocalizedString("email", comment: "")):
				cell.textField.addAtComToolbar()
				
			case (NSLocalizedString("phoneNumber", comment: "")):
				cell.textField.keyboardType = .phonePad
				cell.textField.addDoneToolbar()
				
			case (NSLocalizedString("addressCountry", comment: "")):
				cell.textField.inputView = countryPicker
				cell.textField.addDoneToolbar()
				pickerTextFieldOwner = cell.textField
				
			case (NSLocalizedString("addressZipCode", comment: "")):
				cell.textField.keyboardType = .numberPad
				cell.textField.addDoneToolbar()
				
			case (NSLocalizedString("dateOfBirth", comment: "")):
				cell.textField.addDatePicker()
				cell.textField.addDoneToolbar()
				
			case (NSLocalizedString("taxIDNumber", comment: "")):
				cell.textField.keyboardType = .numberPad
				cell.textField.addDoneToolbar()
				cell.accessoryType = .detailButton
				
			default: break
				
			}
			
			return cell
		
			// set up cell contents for button cells
		case ("upload"):
			let cell = tableView.dequeueReusableCell(withIdentifier: "UploadCell", for: indexPath) as! UploadCell
			cell.titleLabel.text = NSLocalizedString(title, comment: "")
			return cell
			
		case ("button"):
			let cell = tableView.dequeueReusableCell(withIdentifier: "RoundedEdgeCell", for: indexPath) as! RoundedEdgeCell
			cell.button.setTitle(NSLocalizedString(title, comment: ""), for: .normal)
			cell.basicInformationViewController = basicInformationViewController
			return cell
			
		default: break
		}
		
		// return normal cell to satisfy tableView protocol
		return UITableViewCell()
	}
	
	// MARK: TEXT FIELD STUFF
	
	// enable next function
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		// try to find the next field
		if let nextField = textField.superview?.superview?.superview?.viewWithTag(textField.tag + 1) as? UITextField {
			nextField.becomeFirstResponder()
		} else {
			// next tag not found so remove keyboard
			textField.resignFirstResponder()
		}
		
		return false
	}
}
