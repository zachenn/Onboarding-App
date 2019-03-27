//
//  DueDiligenceInformation.swift
//  Test Koi
//
//  Created by Zach Chen on 2/19/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import Foundation

struct DueDiligenceInformation {
	
	// OBJECT VARIABLES
	var ownAccount: Bool?
	var personalBiography: String?
	var primarySourceIncome: String?
	var accountUse: String?
	var pep: Bool?
	var sanctionedBusiness: Bool?
	
	// INITIALIZE VARIABLES
	init(ownAccount: Bool,
		 personalBiography: String,
		 primarySourceIncome: String,
		 accountUse: String,
		 pep: Bool,
		 sanctionedBusiness: Bool) {
		
		self.ownAccount = ownAccount
		self.personalBiography = personalBiography
		self.primarySourceIncome = primarySourceIncome
		self.accountUse = accountUse
		self.pep = pep
		self.sanctionedBusiness = sanctionedBusiness
	}
}
