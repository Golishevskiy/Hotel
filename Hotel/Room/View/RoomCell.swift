//
//  RoomCell.swift
//  Hotel
//
//  Created by Per Pert on 8/3/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import UIKit

class RoomCell: UITableViewCell {
    
    @IBOutlet weak var roomCategoryLabel: UILabel!
    @IBOutlet weak var nameRoomLabel: UILabel!
    @IBOutlet weak var freeRoomLabel: UILabel!
    
    func setupCell(room: Room) {
        roomCategoryLabel.textColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        roomCategoryLabel.text = room.roomCategory.rawValue
        nameRoomLabel.text = "№"+room.roomNumber
        if room.roomIsFree {
            freeRoomLabel.textColor = UIColor(red: 0.1, green: 1, blue: 0.2, alpha: 1)
            freeRoomLabel.text = "free"
        }
        else {
            freeRoomLabel.textColor = UIColor(red: 0.9, green: 0.1, blue: 0.2, alpha: 1)
            freeRoomLabel.text = "reserved"
        }
    }
}
