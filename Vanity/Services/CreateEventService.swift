//
//  CreateEventService.swift
//  Vanity
//
//  Created by Selim Ben Lamine on 8/15/17.
//  Copyright © 2017 Selim Ben Lamine. All rights reserved.
//

import Foundation
import FirebaseDatabase


/* struct CreateEventService {
    static func createInfos (eventTitle: String, date: String, time: String, city: String, address: String, description: String, completion: @escaping (?) -> Void) {
 */
        
        
        
        let eventRef = Database.database().reference().childByAutoId()
        let eid = eventRef.key

