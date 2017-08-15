//
//  UserProfile.swift
//  Vanity
//
//  Created by Selim Ben Lamine on 8/14/17.
//  Copyright © 2017 Selim Ben Lamine. All rights reserved.
//

import UIKit
import FirebaseDatabase


class UserProfile: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        nameLabel.text = User.current.name
        usernameLabel.text = User.current.username
    }
}
    
    

