//
//  ViewController.swift
//  seeid
//
//  Created by Agustian DM on 06/09/20.
//  Copyright © 2020 Agustian DM. All rights reserved.
//

import UIKit
import ProgressHUD

class WelcomeViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var resendVerificationButton: UIButton!
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Navigation
    @IBAction func loginButtonDidTapped(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            ProgressHUD.show()
            
            FUser.loginUserWith(email: emailTextField.text!, password: passwordTextField.text!) { (error, isEmailVerified) in
                
                if error != nil {
                    ProgressHUD.showError(error!.localizedDescription)
                } else if isEmailVerified {
                    
                    ProgressHUD.dismiss()
                    self.goToApp()
                } else {
                    ProgressHUD.showError("Please verify your email!")
                    self.resendVerificationButton.isHidden = false
                }
            }
        }else{
            ProgressHUD.showError("All fields are required")
        }
    }
    
    @IBAction func resendVerificationDidTapped(_ sender: Any) {
        if emailTextField.text != "" {
            FUser.resendVerificationEmail(email: emailTextField.text!) { (error) in
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
    @IBAction func backgroundDidTapped(_ sender: Any) {
        dismissKeyboard()
    }
    
    
    //MARK: - Helpers
    private func goToApp() {
        let homeVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC") as! UITabBarController
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true, completion: nil)
    }
    
    private func dismissKeyboard() {
        self.view.endEditing(false)
    }

}

