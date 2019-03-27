//
//  DisclaimerViewController.swift
//  Koi Compliance
//
//  Created by Zach Chen on 2/27/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class DisclaimerViewController: UIViewController, UITextViewDelegate {
	
	let jurisdiction = Locale.current.languageCode
	
	// MARK: PROPERTIES
	var disclaimerView: DisclaimerView! { return self.view as? DisclaimerView }
	
	override func loadView() {
		view = DisclaimerView(frame: UIScreen.main.bounds)
		disclaimerView.configureView()
		disclaimerView.disclaimerViewController = self
	}
	
	override func viewDidLoad() {
		navigationItem.title = NSLocalizedString("disclaimer", comment: "")
	}
	
	//
	@objc func openBasicInformation() {
		let basicInformationTableViewController = storyboard?.instantiateViewController(withIdentifier: "BasicInformationViewController") as! BasicInformationViewController
		navigationController?.pushViewController(basicInformationTableViewController, animated: true)
	}
	
}
