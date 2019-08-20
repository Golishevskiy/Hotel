//
//  SetupView.swift
//  Hotel
//
//  Created by Per Pert on 8/19/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import Foundation
import UIKit

extension RegistrationViewController {
    
    func settingButton() {
        registrationButtonOutlet.backgroundColor = UIColor(red: 0.5, green: 0.4, blue: 0.6, alpha: 1)
        registrationButtonOutlet.layer.cornerRadius = registrationButtonOutlet.frame.height / 2
        registrationButtonOutlet.tintColor = .white
    }
}
