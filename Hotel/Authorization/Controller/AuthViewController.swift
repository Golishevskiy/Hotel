//
//  AuthViewController.swift
//  Hotel
//
//  Created by Per Pert on 8/9/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    var users = [User]()
    
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //fake users
        let petroUser = User(name: "petro", password: "1", balance: 200)
        let ko = User(name: "ko", password: "10", balance: 1000)
        users.append(petroUser)
        users.append(ko)
        settingButton()
    }
    
    @IBAction func enterButton(_ sender: UIButton) {
        if authorisation(arrayUser: users) {
            performSegue(withIdentifier: "firstScreen", sender: nil)
        } else {
            UIAlertController.alert(title: "FAILING",
                                    msg: "Wrong user or password",
                                    target: self)
        }
    }
    
    @IBAction func registrationButton(_ sender: UIButton) {
        performSegue(withIdentifier: "registrationSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registrationSegue" {
            if let registrationVC = segue.destination as? RegistrationViewController {
                registrationVC.users = users
            }
        }
    }
}

