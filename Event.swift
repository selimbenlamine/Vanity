//
//  Event.swift
//  Vanity
//
//  Created by Selim Ben Lamine on 8/15/17.
//  Copyright © 2017 Selim Ben Lamine. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class Event: NSObject {
    
    let eid: String
    let eventTitle: String
    let date: String
    let time: String
    let city: String
    let address: String
    let eventDescription: String
    
    var dictValue: [String : Any] {
        return ["eventTitle": eventTitle,
                "date": date,
                "time": time,
                "city": city,
                "address": address,
                "eventDescription": eventDescription
                ]
    }
    
        init(eid: String, eventTitle: String, date: String, time: String, city: String, address: String, eventDescription: String) {
            self.eid = eid
            self.eventTitle = eventTitle
            self.date = date
            self.time = time
            self.city = city
            self.address = address
            self.eventDescription = eventDescription
            super.init()
        }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let eventTitle = dict["eventTitle"] as? String,
            let date = dict["date"] as? String,
            let time = dict["time"] as? String,
            let city = dict["city"] as? String,
            let address = dict["address"] as? String,
            let eventDescription = dict["eventDescription"] as? String
            else { return nil }
        
        self.eid = snapshot.key
        self.eventTitle = eventTitle
        self.date = date
        self.time = time
        self.city = city
        self.address = address
        self.eventDescription = eventDescription
        super.init()

    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let eid = aDecoder.decodeObject(forKey: Constants.EventDefaults.eid) as? String,
            let eventTitle = aDecoder.decodeObject(forKey: Constants.EventDefaults.eventTitle) as? String,
            let date = aDecoder.decodeObject(forKey: Constants.EventDefaults.date) as? String,
            let time = aDecoder.decodeObject(forKey: Constants.EventDefaults.time) as? String,
            let city = aDecoder.decodeObject(forKey: Constants.EventDefaults.city) as? String,
            let address = aDecoder.decodeObject(forKey: Constants.EventDefaults.address) as? String,
            let eventDescription = aDecoder.decodeObject(forKey: Constants.EventDefaults.eventDescription) as? String
            else { return nil }
        
        self.eid = eid
        self.eventTitle = eventTitle
        self.date = date
        self.time = time
        self.city = city
        self.address = address
        self.eventDescription = eventDescription
        super.init()
    }



}
extension Event: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(eid, forKey: Constants.EventDefaults.eid)
        aCoder.encode(eventTitle, forKey: Constants.EventDefaults.eventTitle)
        aCoder.encode(date, forKey:Constants.EventDefaults.date)
        aCoder.encode(time, forKey: Constants.EventDefaults.time)
        
    }
}



