//
//  ResetPasswordViewController.swift
//  seeid
//
//  Created by Agustian DM on 10/09/20.
//  Copyright © 2020 Agustian DM. All rights reserved.
//

import UIKit
import ProgressHUD
import Firebase

class ResetPasswordViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var emailTextField: UITextField!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Navigation
    @IBAction func resetPasswordButtonDidTapped(_ sender: Any) {
        if emailTextField.text != "" {
            FUser.resetPassword(email: emailTextField.text!) { (error) in
                if error != nil {
                    ProgressHUD.showError(error!.localizedDescription)
                } else {
                    ProgressHUD.showSuccess("Please check your email!")
                }
            }
        }else{
            ProgressHUD.showError("Insert email address")
        }
    }
    
    //MARK: - Selectors
    @IBAction func backButtonDidTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backgroundDidTapped(_ sender: Any) {
        dismissKeyboard()
    }
    
    
    //MARK: - Helpers
    private func dismissKeyboard() {
        self.view.endEditing(false)
    }
}
