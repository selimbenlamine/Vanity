//
//  Helpers.swift
//  Vanity
//
//  Created by Selim Ben Lamine on 8/2/17.
//  Copyright © 2017 Selim Ben Lamine. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
}
