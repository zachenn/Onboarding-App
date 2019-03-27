//
//  IndividualUser.swift
//  Test Koi
//
//  Created by Zach Chen on 2/19/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import Foundation
import UIKit

struct IndividualUser {
	
	// OBJECT VARIABLES
	var basicInformation: BasicInformation?
	var bankingInformation: BankingInformation?
	var dueDiligence: DueDiligenceInformation
	var userState: String?
	
	// INITIALIZE VARIABLES
	init(basicInformation: BasicInformation,
		 bankingInformation: BankingInformation,
		 dueDiligence: DueDiligenceInformation,
		 userState: String) {
		
		self.basicInformation = basicInformation
		self.bankingInformation = bankingInformation
		self.dueDiligence = dueDiligence
		self.userState = userState
	}
	
	
}
