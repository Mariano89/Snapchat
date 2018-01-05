//
//  LoginViewController.swift
//  
//
//  Created by Mariano Echegoyen on 1/4/18.
//

import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    var loginMode = true
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func topTapped(_ sender: Any) {
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                
                if loginMode {
                    // Login
                } else {
                    // Sign Up
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                        if let error = error {
                            print(error)
                        } else {
                            print("Sign up successful")
                        }
                    })
                }
                
            }
        }
        
        
    }
    
    @IBAction func bottomTapped(_ sender: Any) {
        if loginMode {
            // Switch to Sign Up
            topButton.setTitle("Sign Up", for: .normal)
            bottomButton.setTitle("Switch to Login", for: .normal)
            loginMode = false
        } else {
            // Switch to Login
            topButton.setTitle("Login", for: .normal)
            bottomButton.setTitle("Switch to Sign Up", for: .normal)
            loginMode = true
        }
    }
    
}
