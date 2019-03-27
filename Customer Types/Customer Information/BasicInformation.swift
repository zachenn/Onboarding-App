//
//  BasicInformation.swift
//  Test Koi
//
//  Created by Zach Chen on 2/19/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import Foundation
import UIKit

struct BasicInformation {
	
	// OBJECT VARIABLES
	var uid: String?
	var firstName: String?
	var middleName: String?
	var lastName: String?
	var nativeAlphabetName: String?
	var email: String?
	var phoneNumber: String?
	var addressStreet: String?
	var addressCity: String?
	var addressState: String?
	var addressCountry: String?
	var addressZipCode: String?
	var nationality: String?
	var dateOfBirth: String?
	var taxIDNumber: String?
	var passport: UIImage?
	var verificationPhoto: UIImage?
	var proofOfAddress: UIImage?
	
	// INITIALIZE VARIABLES
	init(uid: String,
		 firstName: String,
		 middleName: String,
		 lastName: String,
		 nativeAlphabetName: String,
		 email: String,
		 phoneNumber: String,
		 addressStreet: String,
		 addressCity: String,
		 addressState: String,
		 addressCountry: String,
		 addressZipCode: String,
		 nationality: String,
		 dateOfBirth: String,
		 taxIDNumber: String,
		 passport: UIImage,
		 verificationPhoto: UIImage,
		 proofOfAddress: UIImage) {
		
		self.uid = uid
		self.firstName = firstName
		self.middleName = middleName
		self.lastName = lastName
		self.nativeAlphabetName = nativeAlphabetName
		self.email = email
		self.phoneNumber = phoneNumber
		self.addressStreet = addressStreet
		self.addressCity = addressCity
		self.addressState = addressState
		self.addressCountry = addressCountry
		self.addressZipCode = addressZipCode
		self.nationality = nationality
		self.dateOfBirth = dateOfBirth
		self.taxIDNumber = taxIDNumber
		self.passport = passport
		self.verificationPhoto = verificationPhoto
		self.proofOfAddress = proofOfAddress
	}
}
