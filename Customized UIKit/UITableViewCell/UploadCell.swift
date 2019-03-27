//
//  UploadCell.swift
//  Koi Compliance
//
//  Created by Zach Chen on 3/4/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class UploadCell: UITableViewCell {
	
	// MARK: PROPERTIES
	let titleLabel = FormLabel()
	
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
		contentView.heightAnchor.constraint(equalToConstant: 40).isActive = true
		
		// cell style
		self.selectionStyle = .default
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
