//
//  UserService.swift
//  Vanity
//
//  Created by Selim Ben Lamine on 8/2/17.
//  Copyright © 2017 Selim Ben Lamine. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth.FIRUser

struct UserService {
    static func create(_ firUser: FIRUser, username: String, completion: @escaping (User?) -> Void) {
        let userAttrs = ["username": username, ]
        
        let ref = Database.database().reference().child("Users").child(firUser.uid)
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = User(snapshot: snapshot)
                completion(user)
            })
        }
}
    static func create(_ firUser: FIRUser, name: String, completion: @escaping (User?) -> Void) {
        let userAttrs = ["name": name]
        
        let ref = Database.database().reference().child("Users").child(firUser.uid)
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = User(snapshot: snapshot)
                completion(user)
            })
        }
    }
}
