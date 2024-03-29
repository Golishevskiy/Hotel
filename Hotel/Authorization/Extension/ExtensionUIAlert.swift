//
//  ExtensionUIAlert.swift
//  Hotel
//
//  Created by Per Pert on 8/15/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    class func alert(title: String, msg: String, target: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
            (result: UIAlertAction) -> Void in
        })
        target.present(alert, animated: true, completion: nil)
    }
}
