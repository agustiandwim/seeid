//
//  ProfileTableViewController.swift
//  seeid
//
//  Created by Agustian DM on 16/09/20.
//  Copyright © 2020 Agustian DM. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    //MARK: - Properties
    var editingMode = false
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameAgeLabel: UILabel!
    @IBOutlet weak var aboutMeTextView: UITextView!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var lookingForTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    @IBOutlet weak var professionTextField: UITextField!
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FUser.currentUser() != nil {
            loadUserData()
            updateEditingMode()
        }
    }
    
    
    //MARK: - Selectors
    @IBAction func cameraButtonDidTapped(_ sender: Any) {
        showPictureOptions()
    }
    
    @IBAction func editInformationDidTapped(_ sender: Any) {
        editingMode.toggle()
        updateEditingMode()
        
        editingMode ? showKeyboard() : hideKeyboard()
        showSaveButton()
    }
    
    @IBAction func settingButtonDidTapped(_ sender: Any) {
        showEditOptions()
    }
    
    @objc func editUserData() {
        
    }
    
    //MARK: - Helper
    private func loadUserData() {
        let currentUser = FUser.currentUser()!
        
        nameAgeLabel.text = currentUser.username + ", \(abs(currentUser.dateOfBirth.interval(ofComponent: .year, fromDate: Date())))"
        
        cityTextField.text = currentUser.country + ", " + currentUser.city
        aboutMeTextView.text = currentUser.about != "" ? currentUser.about : "Hi, welcome to see.id"
        jobTextField.text = currentUser.jobTitle
        professionTextField.text = currentUser.profession
        genderTextField.text = currentUser.isMale ? "Male" : "Female"
        cityTextField.text = currentUser.city
        countryTextField.text = currentUser.country
        heightTextField.text = "\(currentUser.height)"
        lookingForTextField.text = currentUser.lookingFor

    }
    
    //MARK: - AlertController
    private func showPictureOptions() {
        
        let alertController = UIAlertController(title: "Upload Picture", message: "You can change your Avatar or upload more pictures.", preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Change Avatar", style: .default, handler: { (alert) in
            
            //            self.showGallery(forAvatar: true)
        }))
        
        alertController.addAction(UIAlertAction(title: "Upload Pictures", style: .default, handler: { (alert) in
            
            //            self.showGallery(forAvatar: false)
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    private func showEditOptions() {
        
        let alertController = UIAlertController(title: "Edit Account", message: "You are about to edit sensitive information about your account.", preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Change Email", style: .default, handler: { (alert) in
            
            //            self.showChangeField(value: "Email")
        }))
        
        alertController.addAction(UIAlertAction(title: "Change Name", style: .default, handler: { (alert) in
            
            //            self.showChangeField(value: "Name")
        }))
        
        alertController.addAction(UIAlertAction(title: "Sign Out", style: .destructive, handler: { (alert) in
            
            //            self.logOutUser()
        }))
        
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    //MARK: - Editing
    private func updateEditingMode() {
        aboutMeTextView.isUserInteractionEnabled = editingMode
        jobTextField.isUserInteractionEnabled = editingMode
        professionTextField.isUserInteractionEnabled = editingMode
        genderTextField.isUserInteractionEnabled = editingMode
        cityTextField.isUserInteractionEnabled = editingMode
        countryTextField.isUserInteractionEnabled = editingMode
        heightTextField.isUserInteractionEnabled = editingMode
        lookingForTextField.isUserInteractionEnabled = editingMode
    }
    
    private func showSaveButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(editUserData))
        
        navigationItem.rightBarButtonItem = editingMode ? saveButton : nil
    }
    
    private func showKeyboard() {
        self.aboutMeTextView.becomeFirstResponder()
    }
    
    private func hideKeyboard() {
        self.view.endEditing(false)
    }
    
    
}
