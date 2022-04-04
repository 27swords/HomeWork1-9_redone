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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButton(_ sender: Any) {

        let username = usernameTextField.text
        let password = passwordTextField.text

        if username == "111" && password == "222" {
            print("Welcome!")
        } else {
            print("Invalid username or password")
        }
    }
}

