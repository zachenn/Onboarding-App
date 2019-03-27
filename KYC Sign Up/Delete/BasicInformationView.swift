//
//  basicInformationView.swift
//  Test Koi
//
//  Created by Zach Chen on 2/19/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class BasicInformationView: UIView, UITextFieldDelegate {
	
	// MARK: TARGETS
	var basicInformationViewController: BasicInformationViewController? {
		didSet {
			
			// targets
			passportPhotoButton.addTarget(basicInformationViewController, action: #selector(BasicInformationViewController.presentCameraOrLibrary), for: .touchUpInside)
			verificationPhoto.addTarget(basicInformationViewController, action: #selector(BasicInformationViewController.presentCameraOrLibrary), for: .touchUpInside)
			proofOfAddress.addTarget(basicInformationViewController, action: #selector(BasicInformationViewController.presentCameraOrLibrary), for: .touchUpInside)
			
			// delegates
			nationalityPicker.delegate = basicInformationViewController
			nationalityPicker.dataSource = basicInformationViewController
			
			firstNameTextField.delegate = self
			middleNameTextField.delegate = self
			lastNameTextField.delegate = self
			nativeAlphabetNameTextField.delegate = self
			emailTextField.delegate = self
			phoneNumberTextField.delegate = self
			addressStreetTextField.delegate = self
			addressCityTextField.delegate = self
			addressStateTextField.delegate = self
			addressCountryTextField.delegate = self
			addressZipCodeTextField.delegate = self
			nationalityTextField.delegate = self
			
		}
	}
	
	// MARK: CREATE UI OBJECTS
	
	// background and scroll view
	let background: UIView = {
		let background = UIView()
		background.backgroundColor = .white
		background.translatesAutoresizingMaskIntoConstraints = false
		return background
	}()
	
	let scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.backgroundColor = .white
		scrollView.autoresizingMask = .flexibleHeight
		scrollView.isUserInteractionEnabled = true
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		return scrollView
	}()
	
	// mutable separator
	var mutableSeparator = BasicSeparator()
	
	// nationality
	let nationalityLabel = FormLabel()
	let nationalityTextField = FormTextField()
	let nationalityPicker = UIPickerView()
	let separator13 = BasicSeparator()
	
	// first name
	let firstNameLabel = FormLabel()
	let firstNameTextField = FormTextField()
	let separator1 = BasicSeparator()
	
	// middle name
	let middleNameLabel = FormLabel()
	let middleNameTextField = FormTextField()
	let separator2 = BasicSeparator()
	
	// last name
	let lastNameLabel = FormLabel()
	let lastNameTextField = FormTextField()
	let separator3 = BasicSeparator()
	
	// native alphabet name
	let nativeAlphabetNameLabel = FormLabel()
	let nativeAlphabetNameTextField = FormTextField()
	let separator4 = BasicSeparator()
	
	// email. added email toolbar
	let emailLabel = FormLabel()
	let emailTextField = FormTextField()
	let separator5 = BasicSeparator()
	
	// phone number
	let phoneNumberLabel = FormLabel()
	let phoneNumberTextField = FormTextField()
	let separator6 = BasicSeparator()
	
	// address street number
	let addressStreetNumberLabel = FormLabel()
	let addressStreetNumberTextField = FormTextField()
	let separator7 = BasicSeparator()
	
	// address street
	let addressStreetLabel = FormLabel()
	let addressStreetTextField = FormTextField()
	let separator8 = BasicSeparator()
	
	// address city
	let addressCityLabel = FormLabel()
	let addressCityTextField = FormTextField()
	let separator9 = BasicSeparator()
	
	// address state
	let addressStateLabel = FormLabel()
	let addressStateTextField = FormTextField()
	let separator10 = BasicSeparator()
	
	// address country
	let addressCountryLabel = FormLabel()
	let addressCountryTextField = FormTextField()
	let separator11 = BasicSeparator()
	
	// address zip code
	let addressZipCodeLabel = FormLabel()
	let addressZipCodeTextField = FormTextField()
	let separator12 = BasicSeparator()
	
	// date of birth
	let dateOfBirthLabel = FormLabel()
	let dateOfBirthTextField = FormTextField()
	let dateOfBirthPicker = DateOfBirthPicker()
	let separator14 = BasicSeparator()
	
	// tax ID number
	let taxIDNumberLabel = FormLabel()
	let taxIDNumberTextField = FormTextField()
	let separator15 = BasicSeparator()
	
	// passport
	let passportPhotoButton = FormButton()
	let separator16 = BasicSeparator()
	
	// verification photo
	let verificationPhoto = FormButton()
	let separator17 = BasicSeparator()
	
	// proof of address
	let proofOfAddress = FormButton()
	let separator18 = BasicSeparator()
	
	func configureModifications() {
		
		// nationality
		nationalityLabel.text = NSLocalizedString("nationality", comment: "")
		nationalityTextField.placeholder = NSLocalizedString("nationalityPlaceholder", comment: "")
		nationalityTextField.inputView = nationalityPicker
		nationalityTextField.inputAccessoryView = doneToolbar
		
		// first name
		firstNameLabel.text = NSLocalizedString("firstName", comment: "The legal first name of the applicant")
		firstNameTextField.placeholder = NSLocalizedString("firstNamePlaceholder", comment: "")
		
		// middle name
		middleNameLabel.text = NSLocalizedString("middleName", comment: "")
		middleNameTextField.placeholder = NSLocalizedString("middleNamePlaceholder", comment: "")
		
		// last name
		lastNameLabel.text = NSLocalizedString("lastName", comment: "")
		lastNameTextField.placeholder = NSLocalizedString("lastNamePlaceholder", comment: "")
		
		// native alphabet name
		nativeAlphabetNameLabel.text = NSLocalizedString("nativeAlphabetName", comment: "")
		nativeAlphabetNameTextField.placeholder = NSLocalizedString("nativeAlphabetNamePlaceholder", comment: "")
		
		// email
		emailLabel.text = NSLocalizedString("email", comment: "")
		emailTextField.placeholder = NSLocalizedString("emailPlaceholder", comment: "")
		addEmailToolbar(textField: emailTextField)
		
		// phone number
		phoneNumberLabel.text = NSLocalizedString("phoneNumber", comment: "")
		phoneNumberTextField.placeholder = NSLocalizedString("phoneNumberPlaceHolder", comment: "")
		phoneNumberTextField.keyboardType = .phonePad
		phoneNumberTextField.inputAccessoryView = doneToolbar
		
		// address street number
		addressStreetNumberLabel.text = NSLocalizedString("addressStreetNumber", comment: "")
		addressStreetNumberTextField.placeholder = NSLocalizedString("addressStreetNumberPlaceholder", comment: "")
		
		// address street
		addressStreetLabel.text = NSLocalizedString("addressStreet", comment: "")
		addressStreetTextField.placeholder = NSLocalizedString("addressStreetPlaceholder", comment: "")
		
		// address city
		addressCityLabel.text = NSLocalizedString("addressCity", comment: "")
		addressCityTextField.placeholder = NSLocalizedString("addressCityPlaceholder", comment: "")
		
		// address state
		addressStateLabel.text = NSLocalizedString("addressState", comment: "")
		addressStateTextField.placeholder = NSLocalizedString("addressStatePlaceholder", comment: "")
		
		// address country
		addressCountryLabel.text = NSLocalizedString("addressCountry", comment: "")
		addressCountryTextField.placeholder = NSLocalizedString("addressCountryPlaceholder", comment: "")
		addressCountryTextField.inputView = nationalityPicker
		addressCountryTextField.inputAccessoryView = doneToolbar

		// address zip code
		addressZipCodeLabel.text = NSLocalizedString("addressZipCode", comment: "")
		addressZipCodeTextField.placeholder = NSLocalizedString("addressZipCodePlaceholder", comment: "")
		addressZipCodeTextField.keyboardType = .numberPad
		addressZipCodeTextField.inputAccessoryView = doneToolbar
		
		// date of birth
		dateOfBirthLabel.text = NSLocalizedString("dateOfBirth", comment: "")
		dateOfBirthTextField.placeholder = NSLocalizedString("dateOfBirthPlaceholder", comment: "")
		dateOfBirthTextField.inputView = dateOfBirthPicker
		dateOfBirthTextField.inputAccessoryView = doneToolbar
		dateOfBirthPicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
		
		// tax id number
		taxIDNumberLabel.text = NSLocalizedString("taxIDNumber", comment: "")
		taxIDNumberTextField.placeholder = NSLocalizedString("taxIDNumberPlaceholder", comment: "")
		taxIDNumberTextField.keyboardType = .numberPad
		taxIDNumberTextField.inputAccessoryView = doneToolbar
		
		// passport
		passportPhotoButton.setTitle(NSLocalizedString("passportPhoto", comment: ""), for: .normal)
		
		// verification photo
		verificationPhoto.setTitle(NSLocalizedString("verificationPhoto", comment: ""), for: .normal)
		
		// proof of address
		proofOfAddress.setTitle(NSLocalizedString("proofOfAddress", comment: ""), for: .normal)
	}
	
	// MARK: SETUP UI
	func configureView() {
		
		configureModifications()
		let safeArea = safeAreaLayoutGuide
		
		// background
		addSubview(background)
		sendSubviewToBack(background)
		background.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		background.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
		background.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
		background.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
		
		// nationality
		addSubview(nationalityLabel)
		if #available(iOS 11.0, *) {
			nationalityLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
			nationalityLabel.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
			nationalityLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor, constant: -20).isActive = true
		} else {
			nationalityLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
			nationalityLabel.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
			nationalityLabel.widthAnchor.constraint(equalTo: safeArea.widthAnchor, constant: -20).isActive = true
		}
		
		addSubview(nationalityTextField)
		nationalityTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		nationalityTextField.topAnchor.constraint(equalTo: nationalityLabel.bottomAnchor, constant: 10).isActive = true
		nationalityTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 13
		addSubview(separator13)
		separator13.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator13.topAnchor.constraint(equalTo: nationalityTextField.bottomAnchor, constant: 10).isActive = true
		separator13.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator13.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		
	}
	
	func addSignUpFields(selectedCountry: String) {
		
		// scroll view
		addSubview(scrollView)
		scrollView.contentSize.height = 2000
		
//		if #available(iOS 11.0, *) {
//			scrollView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
//			scrollView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
//			scrollView.widthAnchor.constraint(equalTo: safeArea.widthAnchor).isActive = true
//			scrollView.heightAnchor.constraint(equalTo: safeArea.heightAnchor).isActive = true
//		} else {
//			scrollView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//			scrollView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//			scrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
//			scrollView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
//		}
		
		scrollView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		scrollView.topAnchor.constraint(equalTo: separator13.bottomAnchor, constant: 10).isActive = true
		scrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
		scrollView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
		
		// first name
		scrollView.addSubview(firstNameLabel)
		firstNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		firstNameLabel.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
		firstNameLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		scrollView.addSubview(firstNameTextField)
		firstNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 10).isActive = true
		firstNameTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 1
		scrollView.addSubview(separator1)
		separator1.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator1.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 10).isActive = true
		separator1.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator1.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		// middle name
		if (selectedCountry == "People's Republic of China") {
			
			print("no need")
			
		} else {
			
			scrollView.addSubview(middleNameLabel)
			middleNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
			middleNameLabel.topAnchor.constraint(equalTo: separator1.bottomAnchor, constant: 10).isActive = true
			middleNameLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
			
			scrollView.addSubview(middleNameTextField)
			middleNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
			middleNameTextField.topAnchor.constraint(equalTo: middleNameLabel.bottomAnchor, constant: 10).isActive = true
			middleNameTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
			
			// separator 2
			scrollView.addSubview(separator2)
			separator2.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
			separator2.topAnchor.constraint(equalTo: middleNameTextField.bottomAnchor, constant: 10).isActive = true
			separator2.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
			separator2.heightAnchor.constraint(equalToConstant: 1).isActive = true
			
		}
		
		// last name
		scrollView.addSubview(lastNameLabel)
		lastNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		
		lastNameLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		if (selectedCountry == "People's Republic of China") {
			lastNameLabel.topAnchor.constraint(equalTo: separator1.bottomAnchor, constant: 10).isActive = true

		} else {
			lastNameLabel.topAnchor.constraint(equalTo: separator2.bottomAnchor, constant: 10).isActive = true
		}
		
		scrollView.addSubview(lastNameTextField)
		lastNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		lastNameTextField.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 10).isActive = true
		lastNameTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 3
		scrollView.addSubview(separator3)
		separator3.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator3.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 10).isActive = true
		separator3.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator3.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		// native alphabet name
		scrollView.addSubview(nativeAlphabetNameLabel)
		nativeAlphabetNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		nativeAlphabetNameLabel.topAnchor.constraint(equalTo: separator3.bottomAnchor, constant: 10).isActive = true
		nativeAlphabetNameLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		scrollView.addSubview(nativeAlphabetNameTextField)
		nativeAlphabetNameTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		nativeAlphabetNameTextField.topAnchor.constraint(equalTo: nativeAlphabetNameLabel.bottomAnchor, constant: 10).isActive = true
		nativeAlphabetNameTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 4
		scrollView.addSubview(separator4)
		separator4.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator4.topAnchor.constraint(equalTo: nativeAlphabetNameTextField.bottomAnchor, constant: 10).isActive = true
		separator4.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator4.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		// email
		scrollView.addSubview(emailLabel)
		emailLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		emailLabel.topAnchor.constraint(equalTo: separator4.bottomAnchor, constant: 10).isActive = true
		emailLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		scrollView.addSubview(emailTextField)
		emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10).isActive = true
		emailTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 5
		scrollView.addSubview(separator5)
		separator5.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator5.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
		separator5.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator5.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		// phone number
		scrollView.addSubview(phoneNumberLabel)
		phoneNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		phoneNumberLabel.topAnchor.constraint(equalTo: separator5.bottomAnchor, constant: 10).isActive = true
		phoneNumberLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		scrollView.addSubview(phoneNumberTextField)
		phoneNumberTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		phoneNumberTextField.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 10).isActive = true
		phoneNumberTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 6
		scrollView.addSubview(separator6)
		separator6.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator6.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 10).isActive = true
		separator6.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator6.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		// address street
		scrollView.addSubview(addressStreetLabel)
		addressStreetLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		addressStreetLabel.topAnchor.constraint(equalTo: separator6.bottomAnchor, constant: 10).isActive = true
		addressStreetLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		scrollView.addSubview(addressStreetTextField)
		addressStreetTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		addressStreetTextField.topAnchor.constraint(equalTo: addressStreetLabel.bottomAnchor, constant: 10).isActive = true
		addressStreetTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 8
		scrollView.addSubview(separator8)
		separator8.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator8.topAnchor.constraint(equalTo: addressStreetTextField.bottomAnchor, constant: 10).isActive = true
		separator8.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator8.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		// address city
		scrollView.addSubview(addressCityLabel)
		addressCityLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		addressCityLabel.topAnchor.constraint(equalTo: separator8.bottomAnchor, constant: 10).isActive = true
		addressCityLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		scrollView.addSubview(addressCityTextField)
		addressCityTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		addressCityTextField.topAnchor.constraint(equalTo: addressCityLabel.bottomAnchor, constant: 10).isActive = true
		addressCityTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 9
		scrollView.addSubview(separator9)
		separator9.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator9.topAnchor.constraint(equalTo: addressCityTextField.bottomAnchor, constant: 10).isActive = true
		separator9.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator9.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		// address state
		scrollView.addSubview(addressStateLabel)
		addressStateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		addressStateLabel.topAnchor.constraint(equalTo: separator9.bottomAnchor, constant: 10).isActive = true
		addressStateLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		scrollView.addSubview(addressStateTextField)
		addressStateTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		addressStateTextField.topAnchor.constraint(equalTo: addressStateLabel.bottomAnchor, constant: 10).isActive = true
		addressStateTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 10
		scrollView.addSubview(separator10)
		separator10.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator10.topAnchor.constraint(equalTo: addressStateTextField.bottomAnchor, constant: 10).isActive = true
		separator10.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator10.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		// address country
		scrollView.addSubview(addressCountryLabel)
		addressCountryLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		addressCountryLabel.topAnchor.constraint(equalTo: separator10.bottomAnchor, constant: 10).isActive = true
		addressCountryLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		scrollView.addSubview(addressCountryTextField)
		addressCountryTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		addressCountryTextField.topAnchor.constraint(equalTo: addressCountryLabel.bottomAnchor, constant: 10).isActive = true
		addressCountryTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 11
		scrollView.addSubview(separator11)
		separator11.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator11.topAnchor.constraint(equalTo: addressCountryTextField.bottomAnchor, constant: 10).isActive = true
		separator11.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator11.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		// address zip code
		scrollView.addSubview(addressZipCodeLabel)
		addressZipCodeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		addressZipCodeLabel.topAnchor.constraint(equalTo: separator11.bottomAnchor, constant: 10).isActive = true
		addressZipCodeLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		scrollView.addSubview(addressZipCodeTextField)
		addressZipCodeTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		addressZipCodeTextField.topAnchor.constraint(equalTo: addressZipCodeLabel.bottomAnchor, constant: 10).isActive = true
		addressZipCodeTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 12
		scrollView.addSubview(separator12)
		separator12.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator12.topAnchor.constraint(equalTo: addressZipCodeTextField.bottomAnchor, constant: 10).isActive = true
		separator12.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator12.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		// dob
		scrollView.addSubview(dateOfBirthLabel)
		dateOfBirthLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		dateOfBirthLabel.topAnchor.constraint(equalTo: separator12.bottomAnchor, constant: 10).isActive = true
		dateOfBirthLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		scrollView.addSubview(dateOfBirthTextField)
		dateOfBirthTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		dateOfBirthTextField.topAnchor.constraint(equalTo: dateOfBirthLabel.bottomAnchor, constant: 10).isActive = true
		dateOfBirthTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 14
		scrollView.addSubview(separator14)
		separator14.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator14.topAnchor.constraint(equalTo: dateOfBirthTextField.bottomAnchor, constant: 10).isActive = true
		separator14.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator14.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		// tax id number
		scrollView.addSubview(taxIDNumberLabel)
		taxIDNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		taxIDNumberLabel.topAnchor.constraint(equalTo: separator14.bottomAnchor, constant: 10).isActive = true
		taxIDNumberLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		scrollView.addSubview(taxIDNumberTextField)
		taxIDNumberTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		taxIDNumberTextField.topAnchor.constraint(equalTo: taxIDNumberLabel.bottomAnchor, constant: 10).isActive = true
		taxIDNumberTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 15
		scrollView.addSubview(separator15)
		separator15.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator15.topAnchor.constraint(equalTo: taxIDNumberTextField.bottomAnchor, constant: 10).isActive = true
		separator15.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator15.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		// passport
		scrollView.addSubview(passportPhotoButton)
		passportPhotoButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		passportPhotoButton.topAnchor.constraint(equalTo: separator15.bottomAnchor, constant: 10).isActive = true
		passportPhotoButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 16
		scrollView.addSubview(separator16)
		separator16.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator16.topAnchor.constraint(equalTo: passportPhotoButton.bottomAnchor, constant: 10).isActive = true
		separator16.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator16.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		// verification photo
		scrollView.addSubview(verificationPhoto)
		verificationPhoto.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		verificationPhoto.topAnchor.constraint(equalTo: separator16.bottomAnchor, constant: 10).isActive = true
		verificationPhoto.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 17
		scrollView.addSubview(separator17)
		separator17.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator17.topAnchor.constraint(equalTo: verificationPhoto.bottomAnchor, constant: 10).isActive = true
		separator17.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator17.heightAnchor.constraint(equalToConstant: 1).isActive = true
		
		// verification photo
		scrollView.addSubview(proofOfAddress)
		proofOfAddress.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		proofOfAddress.topAnchor.constraint(equalTo: separator17.bottomAnchor, constant: 10).isActive = true
		proofOfAddress.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		
		// separator 18
		scrollView.addSubview(separator18)
		separator18.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		separator18.topAnchor.constraint(equalTo: proofOfAddress.bottomAnchor, constant: 10).isActive = true
		separator18.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		separator18.heightAnchor.constraint(equalToConstant: 1).isActive = true
	}
	
	// MARK: CUSTOM TOOLBARS
	
	// .com and @ for email
	func addEmailToolbar(textField: UITextField) {
		let toolBar = KoiToolbar()
		let atButton = UIBarButtonItem(title: "@", style: .plain, target: self, action: #selector(atSelected))
		let comButton = UIBarButtonItem(title: ".com", style: .plain, target: self, action: #selector(comSelected))
		let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
		toolBar.setItems([flexible, atButton, comButton], animated: false)
		
		textField.inputAccessoryView = toolBar
	}
	
	@objc func atSelected() {
//		let textFieldText = textField.text
//		textField.text = "\(textFieldText ?? "")@"
		let emailTextFieldText = emailTextField.text
		emailTextField.text = "\(emailTextFieldText ?? "")@"
	}
	
	@objc func comSelected() {
		let emailTextFieldText = emailTextField.text
		emailTextField.text = "\(emailTextFieldText ?? "").com"
	}
	
	// done/next for pickers
//	let doneToolbar = KoiToolbar()
	
	let doneToolbar: UIToolbar = {
		let toolbar = KoiToolbar()
		let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneSelected))
		let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
		toolbar.setItems([flexible, doneButton], animated: false)
		return toolbar
	}()

	@objc func doneSelected() {
		if (addressCountryTextField.isFirstResponder) {
			addressCountryTextField.resignFirstResponder()
		} else if (nationalityTextField.isFirstResponder) {
			nationalityTextField.resignFirstResponder()
		} else if (dateOfBirthTextField.isFirstResponder) {
			dateOfBirthTextField.resignFirstResponder()
		} else if (phoneNumberTextField.isFirstResponder) {
			phoneNumberTextField.resignFirstResponder()
		} else if (taxIDNumberTextField.isFirstResponder) {
			taxIDNumberTextField.resignFirstResponder()
		} else if (addressZipCodeTextField.isFirstResponder) {
			addressZipCodeTextField.resignFirstResponder()
		}
	}
	
	@objc func dateChanged(_ sender: UIDatePicker) {
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .long
		dateOfBirthTextField.text = dateFormatter.string(from: sender.date)
	}
	
	// MARK: ENABLE NEXT FUNCTION
	func nextFunction() {
		
		// enable next function
		firstNameTextField.returnKeyType = .next
		middleNameTextField.returnKeyType = .next
		lastNameTextField.returnKeyType = .next
		nativeAlphabetNameTextField.returnKeyType = .next
		emailTextField.returnKeyType = .next
		addressStreetTextField.returnKeyType = .next
		addressCityTextField.returnKeyType = .next
		addressStateTextField.returnKeyType = .next
		addressCountryTextField.returnKeyType = .next
		nationalityTextField.returnKeyType = .next
		
		firstNameTextField.tag = 0
		middleNameTextField.tag = 1
		lastNameTextField.tag = 2
		nativeAlphabetNameTextField.tag = 3
		emailTextField.tag = 4
		phoneNumberTextField.tag = 5
		addressStreetTextField.tag = 6
		addressCityTextField.tag = 7
		addressStateTextField.tag = 8
		addressCountryTextField.tag = 9
		addressZipCodeTextField.tag = 10
		nationalityTextField.tag = 11
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		// try to find the next responder
		if let nextField = firstNameTextField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
			nextField.becomeFirstResponder()
		} else {
			// not found so remove keyboard
			textField.resignFirstResponder()
		}
		
		return false
	}
	
}
