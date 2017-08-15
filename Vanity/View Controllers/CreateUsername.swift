//
//  CreateUsername.swift
//  Vanity
//
//  Created by Selim Ben Lamine on 8/4/17.
//  Copyright © 2017 Selim Ben Lamine. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class createUsername: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBAction func createUsername(_ sender: Any) {
        guard let firUser = Auth.auth().currentUser, let username = usernameTextField.text, !username.isEmpty else { return }
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else { return }
            User.setCurrent(user)
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            if let initialViewController = storyboard.instantiateInitialViewController() {
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
                
            }
        }
    }
}
