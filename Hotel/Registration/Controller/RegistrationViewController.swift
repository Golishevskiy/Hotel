//
//  RegistrationViewController.swift
//  Hotel
//
//  Created by Per Pert on 8/14/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var moneyLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    
    var users: [User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registrationButton(_ sender: UIButton) {
        
        if userIsNew(users) {
            registrationNewUser()
        } else {
            UIAlertController.alert(title: "WRONG NAME",
                                    msg: "please enter a different name",
                                    target: self)
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
        
        let newUser = User(name: nameLabel.text ?? "",
                           password: passwordLabel.text ?? "",
                           balance: Int(moneyLabel.text ?? "0") ?? 0)
        users.append(newUser)
        print(users.count)
    }
    
    func alert(title: String, msg:String) {
        UIAlertController.alert(title: title,
                                msg: msg,
                                target: self)
    }
}




