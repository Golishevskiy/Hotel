//
//  HotelCell.swift
//  Hotel
//
//  Created by Per Pert on 8/3/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import UIKit

class HotelCell: UITableViewCell {
    
    var hotelFunction = HotelFunctions()
    
    @IBOutlet weak var hotelNameLabel: UILabel!
    @IBOutlet weak var hotelAddressLabel: UILabel!
    @IBOutlet weak var freeCountLabel: UILabel!
    
    func setupCell(hotel: Hotel) {
        hotelNameLabel.text = hotel.hotelName
        hotelAddressLabel.text = hotel.hoteAdress
        if hotelFunction.CountRoomIsFree(hotel: hotel) == 0 {
            freeCountLabel.textColor = UIColor(red: 1, green: 0.1, blue: 0.1, alpha: 1)
            freeCountLabel.text = hotelFunction.CountRoomIsFree(hotel: hotel).description
        }
        else {
            freeCountLabel.textColor = UIColor(red: 0.1, green: 1, blue: 0.2, alpha: 1)
            freeCountLabel.text = hotelFunction.CountRoomIsFree(hotel: hotel).description
        }
    }
}

