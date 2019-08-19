//
//  ExtensionAuthVC.swift
//  Hotel
//
//  Created by Per Pert on 8/15/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import Foundation
import UIKit

extension AuthViewController {
    
    func authorisation(arrayUser: [User]) -> Bool {
        for user in arrayUser {
            if user.userName == (loginTextField.text ?? "") && user.userPassword == (passwordTextField.text ?? ""){
                SessionUser.shared.saveUser(user: user)
                return true
            } else {
                continue
            }
        }
        return false
    }
    
    func settingButton() {
        enterButton.backgroundColor = UIColor(red: 0.5, green: 0.4, blue: 0.6, alpha: 1)
        enterButton.layer.cornerRadius = enterButton.frame.height / 2
        enterButton.tintColor = .white
    }
}
