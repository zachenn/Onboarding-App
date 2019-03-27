//
//  BasicInformationViewController.swift
//  Koi Compliance
//
//  Created by Zach Chen on 2/19/19.
//  Copyright © 2019 Zach Chen. All rights reserved.
//
// 

import UIKit

class BasicInformationViewController: UIViewController, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate {

	// MARK: PROPERTIES
	var photoIdentity: String?
	var passportPhoto: UIImage? = UIImage(named: "github")
	var verificationPhoto: UIImage? = UIImage(named: "github")
	var proofOfAddressPhoto: UIImage? = UIImage(named: "github")
	
	var basicInformationBaseView: BasicInformationNationalityView! { return self.view as? BasicInformationNationalityView }
	var basicInformationTableView = BasicInformationTableView()
	let basicInformationDataSource = BasicInformationDataSource()
	
	// MARK: LOAD VIEW
	override func loadView() {
		
		// nationality view
		view = BasicInformationNationalityView(frame: UIScreen.main.bounds)
		basicInformationBaseView.configureView()
		basicInformationBaseView.basicInformationViewController = self
		
		// information fields
		basicInformationTableView.configureView()
		basicInformationTableView.tableView.delegate = self
		basicInformationTableView.tableView.dataSource = basicInformationDataSource

		// information data source
		basicInformationDataSource.basicInformationViewController = self
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		navigationItem.title = NSLocalizedString("basicInformation", comment: "")
		getCountryList()
    }
	
	// MARK: TABLE VIEW ACTIONS
	
	// row selection
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let selectedCell = tableView.cellForRow(at: indexPath)
		
		switch (selectedCell) {
		case is UploadCell:
			presentCameraOrLibrary(sender: selectedCell as! UploadCell)
			selectedCell?.isSelected = false
			
		case is RoundedEdgeCell:
			break
			
		default: break
		}
	}
	
	// MARK: PICKER VIEW DATA SOURCE
		// create an array to store the json file
	var countries = [String]()
	
	// MARK: CAMERA ACTIONS
	@objc func presentCameraOrLibrary(sender: UploadCell) {
		
		// determine which button was pressed
		self.photoIdentity = sender.titleLabel.text
		
		// set up the camera
		let imagePickerController = UIImagePickerController()
		imagePickerController.delegate = self
		
		// set up the action sheet based on which button was pressed
		let actionSheet = UIAlertController(title: sender.titleLabel.text, message: nil, preferredStyle: .actionSheet)

			// cancel
		actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

			// verification photo
		if (self.photoIdentity == NSLocalizedString("verificationPhoto", comment: "")) {
			
			// camera
			actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
				
				if UIImagePickerController.isSourceTypeAvailable(.camera) {
					imagePickerController.sourceType = .camera
					imagePickerController.cameraDevice = .front
					self.present(imagePickerController, animated: true, completion: nil)
				} else {
					print("Camera not available")
				}
			}))
			
		} else {
			
			// camera
			actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
				
				if UIImagePickerController.isSourceTypeAvailable(.camera) {
					imagePickerController.sourceType = .camera
					self.present(imagePickerController, animated: true, completion: nil)
				} else {
					print("Camera not available")
				}
			}))
			
			// photo library
			actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction) in
				imagePickerController.sourceType = .photoLibrary
				self.present(imagePickerController, animated: true, completion: nil)
			}))
		}
		
		// present the action sheet
		self.present(actionSheet, animated: true, completion: nil)
	}
	
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
		
		// assign the new image to the corresponding object
		if (self.photoIdentity == NSLocalizedString("passportPhoto", comment: "")) {
			self.passportPhoto = image
		} else if (self.photoIdentity == NSLocalizedString("verificationPhoto", comment: "")) {
			self.verificationPhoto = image
		} else if (self.photoIdentity == NSLocalizedString("proofOfAddress", comment: "")) {
			self.proofOfAddressPhoto = image
		}
		
		picker.dismiss(animated: true, completion: nil)
	}
	
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		picker.dismiss(animated: true, completion: nil)
	}

	// MARK: BUTTON ACTIONS
	
	// continue button
	@objc func pushBankingInformationViewController() {
		
		// save Basic Information
		basicInformation = BasicInformation(
			uid: UUID().uuidString,
			firstName: basicInformationString(title: "firstName"),
			middleName: basicInformationString(title: "middleName"),
			lastName: basicInformationString(title: "lastName"),
			nativeAlphabetName: basicInformationString(title: "nativeAlphabetName"),
			email: basicInformationString(title: "email"),
			phoneNumber: basicInformationString(title: "phoneNumber"),
			addressStreet: basicInformationString(title: "addressStreet"),
			addressCity: basicInformationString(title: "addressCity"),
			addressState: basicInformationString(title: "addressState"),
			addressCountry: basicInformationString(title: "addressCountry"),
			addressZipCode: basicInformationString(title: "addressZipCode"),
			nationality: basicInformationString(title: "nationality"),
			dateOfBirth: basicInformationString(title: "dateOfBirth"),
			taxIDNumber: basicInformationString(title: "taxIDNumber"),
			passport: self.passportPhoto!,
			verificationPhoto: self.verificationPhoto!,
			proofOfAddress: self.proofOfAddressPhoto!)
		
		// push to CDD Questionnaire
		let bankingInformationViewController = storyboard?.instantiateViewController(withIdentifier: "BankingInformationViewController") as! BankingInformationViewController
		navigationController?.pushViewController(bankingInformationViewController, animated: true)
	}
	
	func basicInformationString(title: String) -> String {
		let textField =  basicInformationTableView.tableView.viewWithTag(basicInformationDataSource.basicInformationTag[NSLocalizedString(title, comment: "")] ?? 0) as? UITextField
		return textField?.text ?? ""
	}
	
	
}

