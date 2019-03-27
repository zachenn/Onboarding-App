//
//  DisclaimerView.swift
//  Koi Compliance
//
//  Created by Zach Chen on 3/5/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class DisclaimerView: UIView {
	
	// MARK: TARGETS
	var disclaimerViewController: DisclaimerViewController? {
		didSet {
			
			// targets
			confirmButton.addTarget(disclaimerViewController, action: #selector(DisclaimerViewController.openBasicInformation), for: .touchUpInside)
			
		}
	}
	
	// MARK: CREATE UI OBJECTS
	
	// scroll view
	let scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.backgroundColor = .white
		scrollView.autoresizingMask = .flexibleHeight
		scrollView.isUserInteractionEnabled = true
		scrollView.showsVerticalScrollIndicator = false
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		return scrollView
	}()
	
	// heading
	let disclaimerHeading = FormLabel()
	
	// body
	let bodyTwo: UITextView = {
		let textView = UITextView()
		
		// create the different text groups
		let boldTitleOne = NSLocalizedString("disclaimerTitleOne", comment: "")
		let boldTitleOneAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]
		let attributedBoldTitleOne = NSMutableAttributedString(string: boldTitleOne, attributes: boldTitleOneAttributes)
		
		let normalTextOne = NSLocalizedString("disclaimerBodyOne", comment: "")
		let normalStringOne = NSMutableAttributedString(string: normalTextOne)
		
		let boldTitleTwo = NSLocalizedString("disclaimerTitleTwo", comment: "")
		let boldTitleTwoAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]
		let attributedBoldTitleTwo = NSMutableAttributedString(string: boldTitleTwo, attributes: boldTitleTwoAttributes)
		
		let normalTextTwo = NSLocalizedString("disclaimerBodyTwo", comment: "")
		let normalStringTwo = NSMutableAttributedString(string: normalTextOne)
		
		let boldTextOne = NSLocalizedString("disclaimerBodyTwoBoldText", comment: "")
		let boldTextOneAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]
		let attributedBoldTextOne = NSMutableAttributedString(string: boldTextOne, attributes:boldTextOneAttributes)
		
		let normalTextThree = NSLocalizedString("disclaimerBodyTwoTwo", comment: "")
		let normalStringThree = NSMutableAttributedString(string: normalTextThree)
		
		// add them all onto a mutable attributed string
		let attributedString = attributedBoldTitleOne
		attributedString.append(normalStringOne)
		attributedString.append(attributedBoldTitleTwo)
		attributedString.append(normalStringTwo)
		attributedString.append(attributedBoldTextOne)
		attributedString.append(normalStringThree)
		
		// set the textviews attributed text to the attributed string we just created
		textView.attributedText = attributedString

		// further styling of textview
		textView.isEditable = false
		textView.isScrollEnabled = false
		textView.translatesAutoresizingMaskIntoConstraints = false
		return textView
	}()
	
	// confirm button
	let confirmButton = StandardRoundedEdgeButton()
	
	// MARK: SET UP UI OBJECTS
	private func configureUIModifications() {
		
		// heading
		disclaimerHeading.text = NSLocalizedString("disclaimerHeading", comment: "")
		
		// confirm button
		confirmButton.setTitle(NSLocalizedString("confirmAndContinue", comment: "Used for when the user has read the disclaimer and acknowledges that he/she has read it"), for: .normal)
	}
	
	func configureView() {
		
		configureUIModifications()
		backgroundColor = .white
		let safeArea = safeAreaLayoutGuide
		scrollView.contentSize.height = frame.size.height
		addSubview(scrollView)
		
		if #available(iOS 11.0, *) {
			scrollView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
			scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
			scrollView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, constant: -20).isActive = true
			scrollView.heightAnchor.constraint(equalTo: safeArea.heightAnchor).isActive = true
		} else {
			scrollView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
			scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
			scrollView.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
			scrollView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
		}
		
		scrollView.addSubview(disclaimerHeading)
		disclaimerHeading.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		disclaimerHeading.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
		disclaimerHeading.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
		
		// body
		scrollView.addSubview(bodyTwo)
		bodyTwo.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		bodyTwo.topAnchor.constraint(equalTo: disclaimerHeading.bottomAnchor, constant: 10).isActive = true
		bodyTwo.widthAnchor.constraint(equalTo: widthAnchor, constant: -20).isActive = true
		bodyTwo.heightAnchor.constraint(equalToConstant: 650).isActive = true
		
		// confirm button
		scrollView.addSubview(confirmButton)
		confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
		confirmButton.topAnchor.constraint(equalTo: bodyTwo.bottomAnchor, constant: 10).isActive = true
		confirmButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -40).isActive = true
		confirmButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
		
	}
}
