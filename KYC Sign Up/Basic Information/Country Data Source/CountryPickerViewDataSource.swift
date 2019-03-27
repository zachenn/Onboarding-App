//
//  CountryPickerViewDataSource.swift
//  Koi Compliance
//
//  Created by Zach Chen on 2/21/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

extension BasicInformationViewController: UIPickerViewDataSource {
	
	// MARK: read JSON file
	func getCountryList() {
		
		// parse JSON for initial phoneCode
		let url = Bundle.main.url(forResource: "Countries", withExtension: "json") // store a reference to the file location
		let data = try? Data(contentsOf: url!) // grab the data
		
		do { // do-catch b/c json serialization can fail
			let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
			if let dictionary = object as? [String] {// [String: String] {
				readJSONObject(object: dictionary)
				
			}
		} catch {
			// Handle Error
		}
	}

	func readJSONObject(object: [String]) {
		if let countryArray = object as? [String] {
			countries = countryArray
		}
	}
	
	// MARK: SET UP PICKER VIEW
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return countries.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return countries[row]
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		
		// update text in text field that calls it
		if (basicInformationBaseView.nationalityTextField.isFirstResponder) {
			basicInformationBaseView.nationalityTextField.text = countries[row]
			
			// grab information from JSON based on which country was picked
			var country = countries[row]
			if (country != "United States" && country != "People's Republic of China") {
				country = "Non US"
			}
			
			basicInformationDataSource.getBasicInformationList(country: country)
			basicInformationTableView.tableView.reloadData()
			basicInformationBaseView.addNewView(tableView: basicInformationTableView)
			
			
		} else {
			let textField = basicInformationDataSource.pickerTextFieldOwner
			textField?.text = countries[row]
		}
	
	}

}
