//
//  BankingInformationViewController.swift
//  Koi Compliance
//
//  Created by Zach Chen on 3/6/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class BankingInformationViewController: UIViewController, UITableViewDelegate {
	
	// MARK: PROPERTIES
	var bankingInformationView: BankingInformationView! { return self.view as? BankingInformationView }
	var bankingInformationDataSource = BankingInformationDataSource()
	
	var bankVerificationDocument: UIImage? = UIImage(named: "github")
	
	// MARK: LOAD VIEW
	override func loadView() {
		view = BankingInformationView(frame: UIScreen.main.bounds)
		bankingInformationView.configureView()
		bankingInformationView.tableView.delegate = self
		bankingInformationView.tableView.dataSource = bankingInformationDataSource
		bankingInformationDataSource.getBankingInformation()
	}
	
	override func viewDidLoad() {
		
	}
	
	// MARK: TABLE VIEW ACTIONS
	
	// row selection
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("ok")
	}
	
	// MARK: BUTTON ACTIONS
	
	// continue button
	@objc func continueDidPress() {
		
		// save banking information
		bankingInformation = BankingInformation(
			bankName: NSLocalizedString("bankName", comment: ""),
			bankAddressStreet: NSLocalizedString("bankAddressStreet", comment: ""),
			bankAddressCity: NSLocalizedString("bankAddressCity", comment: ""),
			bankAddressState: NSLocalizedString("bankAddressState", comment: ""),
			bankAddressCountry: NSLocalizedString("bankAddressCountry", comment: ""),
			bankAccountNumber: NSLocalizedString("bankAccountNumber", comment: ""),
			bankSwiftOrRoutingNumber: NSLocalizedString("bankSwiftOrRoutingNumber", comment: ""),
			bankAccountHolderName: NSLocalizedString("bankAccountHolderName", comment: ""),
			bankVerificationDocuments: bankVerificationDocument!)
		
	}
	
	func bankingInformationString(title: String) -> String {
		let textField =  bankingInformationView.tableView.viewWithTag(bankingInformationDataSource.bankingInformationTag[NSLocalizedString(title, comment: "")] ?? 0) as? UITextField
		return textField?.text ?? ""
	}
}
