//
//  LoginViewController.swift
//  Vanity
//
//  Created by Selim Ben Lamine on 8/2/17.
//  Copyright © 2017 Selim Ben Lamine. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase
import FirebaseFacebookAuthUI


typealias FIRUser = FirebaseAuth.User

class SignUpViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 6
    }
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text,
            let password = passwordTextField.text,
            let email = emailTextField.text,
            let name = nameTextField.text
            else {
                return
        }
        
        AuthService.createUser(controller: self, email: email, password: password) { (authUser) in
            guard let firUser = authUser else {
                return
            }
            
            UserService.create(firUser, username: username, name: name, email: email) { (user) in
                guard let user = user else {
                    // handle error
                    return
                }
                
                User.setCurrent(user, writeToUserDefaults: true)
                
                let storyboard = UIStoryboard(name: "Main", bundle: .main)
                if let initialViewController = storyboard.instantiateInitialViewController() {
                    self.view.window?.rootViewController = initialViewController
                    self.view.window?.makeKeyAndVisible()
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.usernameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
        self.emailTextField.resignFirstResponder()
        self.nameTextField.resignFirstResponder()
    }
}
