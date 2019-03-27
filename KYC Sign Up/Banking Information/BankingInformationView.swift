//
//  BankingInformationView.swift
//  Koi Compliance
//
//  Created by Zach Chen on 3/6/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//

import UIKit

class BankingInformationView: UIView {
	
	// MARK: CREATE UI OBJECTS
	lazy var tableView = UITableView(frame: .zero, style: .plain)
	
	// MARK: SET UP VIEW
	private func configureUIModifications() {
		
		// table view
		tableView.tableFooterView = UIView(frame: .zero)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		tableView.register(InformationCollectionCell.self, forCellReuseIdentifier: "InformationCollectionCell")
		tableView.register(UploadCell.self, forCellReuseIdentifier: "UploadCell")
		tableView.register(RoundedEdgeCell.self, forCellReuseIdentifier: "RoundedEdgeCell")
	}
	
	func configureView() {
		
		configureUIModifications()
		let safeArea = safeAreaLayoutGuide
		
		// table view
		addSubview(tableView)
		if #available(iOS 11, *) {
			tableView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
			tableView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor).isActive = true
			tableView.widthAnchor.constraint(equalTo: safeArea.widthAnchor).isActive = true
			tableView.heightAnchor.constraint(equalTo: safeArea.heightAnchor).isActive = true
		} else {
			tableView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
			tableView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
			tableView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
			tableView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
		}
	}
}
