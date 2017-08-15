//
//  CreateEvent.swift
//  Vanity
//
//  Created by Selim Ben Lamine on 8/15/17.
//  Copyright © 2017 Selim Ben Lamine. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CreateEvent: UIViewController {
    
    // CREATE TEXT FIELDS
    @IBOutlet weak var eventTitleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
