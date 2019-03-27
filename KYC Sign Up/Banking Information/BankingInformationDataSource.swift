//
//  BankingInformationDataSource.swift
//  Koi Compliance
//
//  Created by Zach Chen on 3/6/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class BankingInformationDataSource: NSObject {
	
	var bankingInformationTitleFields = [String]()
	var bankingInformationCellTypes = [String]()
	var bankingInformationPlaceholderFields = [String]()
	var bankingInformationTag = [String: Int]()

}

extension BankingInformationDataSource: UITableViewDataSource, UITextFieldDelegate {
	
	// MARK: GRAB INFORMATION FROM JSON
	
	// read JSON file
	func getBankingInformation() {
		
		let url = Bundle.main.url(forResource: "Banking Information", withExtension: "json") // store a reference to the file location
		let data = try? Data(contentsOf: url!) // grab the data
		
		do {
			let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
			if let dictionary = object as? [String: Any] {
				readJSONObject(object: dictionary)
			}
		} catch {
			
		}
	}
	
	func readJSONObject(object: [String: Any]) {
		
		if let informationTitles = object["Banking Information Titles"] as? [[String]],
			let informationCellTypes = object["Banking Information Cell Types"] as? [[String]],
			let informationPlaceholders = object["Banking Information Placeholders"] as? [[String]] {
			
			var titles = [String]()
			var cellTypes = [String]()
			var placeholders = [String]()
			
			// titles
			for field in informationTitles {
				for rowItem in field {
					titles.append(rowItem)
				}
			}
			
			// cell types
			for field in informationCellTypes {
				for rowItem in field {
					cellTypes.append(rowItem)
				}
			}
			
			// placeholders
			for field in informationPlaceholders {
				for rowItem in field {
					placeholders.append(rowItem)
				}
			}
			
			// all
			bankingInformationTitleFields = titles
			bankingInformationCellTypes = cellTypes
			bankingInformationPlaceholderFields = placeholders
		}

		
		
	}
	
	// MARK: SET UP TABLE
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return bankingInformationTitleFields.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let title = bankingInformationTitleFields[indexPath.row]
		let placeholder = bankingInformationPlaceholderFields[indexPath.row]
		
		// set up cell contents based on cell type
		switch bankingInformationCellTypes[indexPath.row] {
		
			// set up cell contents for textField cells
		case ("textField"):
			let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCollectionCell", for: indexPath) as! InformationCollectionCell
			
			cell.titleLabel.text = NSLocalizedString(title, comment: "")
			cell.textField.placeholder = NSLocalizedString(placeholder, comment: "")
			cell.textField.delegate = self
			cell.textField.tag = indexPath.row + 100
			
			bankingInformationTag[cell.titleLabel.text!] = cell.textField.tag
		
			return cell
			
			// set up cell contents for button cells
		case ("upload"):
			let cell = tableView.dequeueReusableCell(withIdentifier: "UploadCell", for: indexPath) as! UploadCell
			cell.titleLabel.text = NSLocalizedString(title, comment: "")
			return cell
			
		case ("button"):
			let cell = tableView.dequeueReusableCell(withIdentifier: "RoundedEdgeCell", for: indexPath) as! RoundedEdgeCell
			cell.button.setTitle(NSLocalizedString(title, comment: ""), for: .normal)
			return cell
			
		default:
			break
		}
		
		// return normal cell to satisfy tableView protocol
		return UITableViewCell()
	}
	
	// MARK: TEXTFIELD STUFF
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		if let nextTextField = textField.superview?.superview?.superview?.viewWithTag(textField.tag + 1) as? UITextField {
			nextTextField.becomeFirstResponder()
		} else {
			textField.resignFirstResponder()
		}
		
		return false
	}
}
