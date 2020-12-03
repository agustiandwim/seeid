//
//  SignUpViewController.swift
//  seeid
//
//  Created by Agustian DM on 10/09/20.
//  Copyright © 2020 Agustian DM. All rights reserved.
//

import UIKit
import ProgressHUD

class SignUpViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var genderSegmentOutlet: UISegmentedControl!
    
    var isMale = true
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIDatePicker()
    }
    
    //MARK: - Navigation
    @IBAction func signUpButtonDidTapped(_ sender: Any) {
        if isTextDataInputed() {
            if passwordTextField.text! == confirmPasswordTextField.text! {
                signUpUser()
            }else{
                ProgressHUD.showError("Password don't match")
            }
        }else{
            ProgressHUD.showError("All fields required")
        }
    }
    
    
    //MARK: - Selectors
    @IBAction func genderSegmentValueChanged(_ sender: UISegmentedControl) {
        isMale = sender.selectedSegmentIndex == 0
    }
    
    @IBAction func backgroundDidTapped(_ sender: Any) {
        dismissKeyboard()
    }
    
    @IBAction func backLoginDidTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    //MARK: - Helpers
    private func signUpUser() {
        
        ProgressHUD.show()
        
        FUser.signUpUserWith(email: emailTextField.text!,
                             password: passwordTextField.text!,
                             username: usernameTextField.text!,
                             city: cityTextField.text!,
                             isMale: isMale,
                             dateOfBirth: datePicker.date) { (error) in
                                
                                if error == nil {
                                    ProgressHUD.showSuccess("Verification email sent!")
                                    self.dismiss(animated: true, completion: nil)
                                } else {
                                    ProgressHUD.showError(error!.localizedDescription)
                                }
        }
    }
    
    private func isTextDataInputed() -> Bool {
        
        return usernameTextField.text != "" && emailTextField.text != "" && cityTextField.text != "" && passwordTextField.text != "" && confirmPasswordTextField.text != ""
    }
        
    private func dismissKeyboard() {
        self.view.endEditing(false)
    }
    
    func setupUIDatePicker() {
        datePicker.backgroundColor = .clear
    }



}
