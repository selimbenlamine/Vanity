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
        
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty else { return }
        
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else {
                // handle error
                return
            }
            
            guard let firUser = Auth.auth().currentUser,
                let name = self.nameTextField.text,
                !name.isEmpty else { return }
            
            
            UserService.create(firUser, name: name) { (user) in
                guard user != nil else {
                    // handle error
                    return
                }
            }
            guard let email = self.emailTextField.text, let password = self.passwordTextField.text else { return }
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] (user, error) in
                if let error = error {
                    
                    self?.alert(message: error.localizedDescription)
                    return
                }
                Database.database().reference().child("Users").child(user!.uid).updateChildValues(["email": email, "username": username, "name": name])
                let changeRequest = user!.createProfileChangeRequest()
                changeRequest.displayName = username
                changeRequest.commitChanges(completion: nil)
                
                
            }
            User.setCurrent(user, writeToUserDefaults: true)
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            if let initialViewController = storyboard.instantiateInitialViewController() {
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
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
