//
//  User.swift
//  Hotel
//
//  Created by Per Pert on 8/14/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import Foundation

class User {
    let userName: String
    let userPassword: String
    var balance: Int = 0
    
    init(name: String, password: String, balance: Int) {
        self.userName = name
        self.userPassword = password
        self.balance = balance
    }
}
