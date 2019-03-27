//
//  bankingInformation.swift
//  Test Koi
//
//  Created by Zach Chen on 2/19/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import Foundation
import UIKit

struct BankingInformation {
	
	// OBJECT VARIABLES
	var bankName: String?
	var bankAddressStreet: String?
	var bankAddressCity: String?
	var bankAddressState: String?
	var bankAddressCountry: String?
	var bankAccountNumber: String?
	var bankSwiftOrRoutingNumber: String?
	var bankAccountHolderName: String?
	var bankVerificationDocuments: UIImage?
	
	// INITIALIZE VARIABLES
	init(bankName: String,
		 bankAddressStreet: String,
		 bankAddressCity: String,
		 bankAddressState: String,
		 bankAddressCountry: String,
		 bankAccountNumber: String,
		 bankSwiftOrRoutingNumber: String,
		 bankAccountHolderName: String,
		 bankVerificationDocuments: UIImage) {
		
		self.bankName = bankName
		self.bankAddressStreet = bankAddressStreet
		self.bankAddressCity = bankAddressCity
		self.bankAddressState = bankAddressState
		self.bankAddressCountry = bankAddressCountry
		self.bankAccountNumber = bankAccountNumber
		self.bankSwiftOrRoutingNumber = bankSwiftOrRoutingNumber
		self.bankAccountHolderName = bankAccountHolderName
		self.bankVerificationDocuments = bankVerificationDocuments
	}
	
}
