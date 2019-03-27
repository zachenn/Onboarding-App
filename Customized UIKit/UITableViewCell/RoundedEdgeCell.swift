//
//  RoundedEdgeCell.swift
//  Koi Compliance
//
//  Created by Zach Chen on 3/6/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class RoundedEdgeCell: UITableViewCell {
	
	// MARK: PROPERTIES
	let titleLabel = FormLabel()
	let button = StandardRoundedEdgeButton()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		let marginGuide = contentView.layoutMarginsGuide
		
		// configure title
		contentView.addSubview(titleLabel)
		titleLabel.centerXAnchor.constraint(equalTo: marginGuide.centerXAnchor).isActive = true
		titleLabel.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor).isActive = true
		titleLabel.widthAnchor.constraint(equalTo: marginGuide.widthAnchor).isActive = true
		titleLabel.heightAnchor.constraint(equalTo: marginGuide.heightAnchor).isActive = true
		
		// configure button
		contentView.addSubview(button)
		button.centerXAnchor.constraint(equalTo: marginGuide.centerXAnchor).isActive = true
		button.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor).isActive = true
		button.widthAnchor.constraint(equalTo: marginGuide.widthAnchor, constant: -40).isActive = true
		button.heightAnchor.constraint(equalToConstant: 40).isActive = true
		
		// configure cell
		contentView.heightAnchor.constraint(equalToConstant: 80).isActive = true
		
		// cell style
		self.selectionStyle = .none
		self.separatorInset = UIEdgeInsets(top: 0, left: 1000, bottom: 0, right: 0)
		self.contentView.backgroundColor = .clear
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	// banking information view controller
	var basicInformationViewController: BasicInformationViewController? {
		
		didSet{
			button.addTarget(basicInformationViewController, action: #selector(BasicInformationViewController.pushBankingInformationViewController), for: .touchUpInside)
		}
	}
	
	
}
