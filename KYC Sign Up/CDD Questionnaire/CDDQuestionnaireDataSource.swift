//
//  CDDQuestionnaireDataSource.swift
//  Koi Compliance
//
//  Created by Zach Chen on 3/8/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class CDDQuestionnaireDataSource: NSObject {

	var CDDTitleFields = [String]()
	var CDDCellTypes = [String]()
	var CDDPlaceholderFields = [String]()

}

extension CDDQuestionnaireDataSource: UITableViewDataSource, UITextFieldDelegate {

	// MARK: GRAB INFORMATION FROM JSON

	// read JSON file
	func getCDDQuestionnaire() {

	}

	func readJSONObject(object: [String: Any]) {
		
	}

	// MARK: SET UP TABLE
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return CDDTitleFields.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let title = CDDTitleFields[indexPath.row]
		let placeholder = CDDPlaceholderFields[indexPath.row]

		// set up cell contents based on cell type
		switch CDDCellTypes[indexPath.row] {

		// set up cell contents for textField cells
		case ("textField"):
			let cell = tableView.dequeueReusableCell(withIdentifier: "InformationCollectionCell", for: indexPath) as! InformationCollectionCell

			cell.titleLabel.text = NSLocalizedString(title, comment: "")
			cell.textField.placeholder = NSLocalizedString(placeholder, comment: "")
			cell.textField.delegate = self
			cell.textField.tag = indexPath.row + 100

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

