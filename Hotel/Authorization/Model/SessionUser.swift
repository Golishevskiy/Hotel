//
//  SessionUser.swift
//  Hotel
//
//  Created by Per Pert on 8/19/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import Foundation

class SessionUser {
    
    static let shared = SessionUser()
    var user: User?
    
    func saveUser(user: User?){
        if user != nil {
            self.user = user
        } else {
            print("not save userLogined")
        }
    }
}
