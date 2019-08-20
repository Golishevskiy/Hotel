//
//  RegistrationViewController.swift
//  Hotel
//
//  Created by Per Pert on 8/14/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var moneyLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var registrationButtonOutlet: UIButton!
    
    var users: [User]!
    
    override func viewDidLoad() {
        self.nameLabel.delegate = self
        self.passwordLabel.delegate = self
        self.moneyLabel.delegate = self
        settingButton()
    }
    
    @IBAction func registrationButton(_ sender: UIButton) {
        
        if userIsNew(users) {
            registrationNewUser()
        } else {
            alert(title: "WRONG NAME", msg: "please enter a different name")
        }
    }
    
    func userIsNew(_ usersArray: [User]) -> Bool {
        var result = true
        for user in usersArray {
            if user.userName == nameLabel.text ?? "" {
                result = false
            }
        }
        return result
    }
    
    func registrationNewUser() {
        
        if nameLabel.text == "" {
            alert(title: "NO NAME", msg: "Please write name")
            return
        }
        
        if passwordLabel.text == "" {
            alert(title: "PASSWORD IS EMPTY", msg: "Please write password")
            return
        }
        
        if moneyLabel.text == "" {
            alert(title: "MONEY", msg: "Please write money")
            return
        }
        
        if Int(moneyLabel.text!) == nil {
            alert(title: "MONEY", msg: "Please write money")
            return
        }
        
        let newUser = User(name: nameLabel.text!,
                           password: passwordLabel.text!,
                           balance: Int(moneyLabel.text ?? "0") ?? 0)
        users.append(newUser)
        print(users.count)
        if newUser != nil {
            SessionUser.shared.saveUser(user: newUser)
            self.performSegue(withIdentifier: "startScreen", sender: self)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameLabel.resignFirstResponder()
        passwordLabel.resignFirstResponder()
        moneyLabel.resignFirstResponder()
        return true
    }
    
    func alert(title: String, msg: String) {
        UIAlertController.alert(title: title,
                                msg: msg,
                                target: self)
    }
}






