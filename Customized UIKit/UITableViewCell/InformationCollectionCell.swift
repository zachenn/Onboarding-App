//
//  InformationCollectionCell.swift
//  Koi Compliance
//
//  Created by Zach Chen on 2/28/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class InformationCollectionCell: UITableViewCell {
	
	// MARK: PROPERTIES
	let titleLabel = FormLabel()
	let textField = FormTextField()
	
	// MARK: INITIALIZERS
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		let marginGuide = contentView.layoutMarginsGuide
		
		// configure titleLabel
		contentView.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
		titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
		
		// configure detailLabel
		contentView.addSubview(textField)
		textField.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
		textField.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
		textField.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
		textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
		
		// style
		self.selectionStyle = .none

	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
