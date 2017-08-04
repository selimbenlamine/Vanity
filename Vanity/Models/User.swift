//
//  User.swift
//  Vanity
//
//  Created by Selim Ben Lamine on 8/2/17.
//  Copyright © 2017 Selim Ben Lamine. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User: NSObject {
    
    // MARK: - Properties
    
    let uid: String
    let username: String
    let name: String
    let email: String

    var dictValue: [String : Any] {
        return ["username": username,
                "name": name,
                "email" : email]
    }

    
    // MARK: - Init
    
    init(uid: String, username: String, name: String, email: String) {
        self.uid = uid
        self.username = username
        self.name = name
        self.email = email
        super.init()
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
        let username = dict["username"] as? String,
        let name = dict["name"] as? String,
        let email = dict["email"] as? String
        else { return nil }
        
        self.uid = snapshot.key
        self.username = username
        self.name = name
        self.email = email
        super.init()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefaults.uid) as? String,
            let username = aDecoder.decodeObject(forKey: Constants.UserDefaults.username) as? String,
            let name = aDecoder.decodeObject(forKey: Constants.UserDefaults.name) as? String,
            let email = aDecoder.decodeObject(forKey: Constants.UserDefaults.email) as? String
            else { return nil }
        
        self.uid = uid
        self.username = username
        self.name = name
        self.email = email
        
        super.init()
    }
    
    // MARK: - Singleton
    
    // 1
    private static var _current: User?
    
    // 2
    static var current: User {
        // 3
        guard let currentUser = _current else {
            fatalError("Error: current user doesn’t exist")
        }
        
        // 4
        return currentUser
    }
    
    // MARK: - Class Methods
    
    // 1
    class func setCurrent(_ User: User, writeToUserDefaults: Bool = false) {
        // 2
        if writeToUserDefaults {
            // 3
            let data = NSKeyedArchiver.archivedData(withRootObject: User)
            
            // 4
            UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
        }
        
        _current = User
    }
}

extension User: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: Constants.UserDefaults.uid)
        aCoder.encode(username, forKey: Constants.UserDefaults.username)
        aCoder.encode(name, forKey:Constants.UserDefaults.name)
        aCoder.encode(email, forKey: Constants.UserDefaults.email)
    }
}
