//
//  LoginViewController.swift
//  HomeWork1-9
//
//  Created by Alexander Chervoncev on 4.04.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet var gradientLoginView: GradientLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        // Login details
        let username = usernameTextField.text
        let password = passwordTextField.text

        if username == "111" && password == "111" {
            print("Welcome")
        } else {
            print("Invalid username or password")
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let checkResult = checkUserData()
        
        if !checkResult {
            showLoginError()
        }
        
        return checkResult
    }
    // Password and login to log in to the system
    func checkUserData() -> Bool {
        
        guard let userName = usernameTextField.text,
              let password = passwordTextField.text else { return false }
        
        if userName == "111" && password == "111" {
            return true
        } else {
            return false
        }
    }
    // Alert with an error
    func showLoginError() {
        
        let alert = UIAlertController(
            title: "Error",
            message: "Invalid username or password",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

