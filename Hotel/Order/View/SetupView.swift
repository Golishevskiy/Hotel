//
//  SetupView.swift
//  Hotel
//
//  Created by Per Pert on 8/19/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import Foundation
import UIKit

extension OrderViewController {
    
    func settingButton() {
        bayButtonOutlet.backgroundColor = UIColor(red: 0.5, green: 0.4, blue: 0.6, alpha: 1)
        bayButtonOutlet.layer.cornerRadius = bayButtonOutlet.frame.height / 2
        bayButtonOutlet.tintColor = .white
    }
}
