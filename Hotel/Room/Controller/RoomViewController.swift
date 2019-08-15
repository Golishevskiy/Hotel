//
//  RoomViewController.swift
//  Hotel
//
//  Created by Per Pert on 8/3/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import UIKit

class RoomViewController: UITableViewController {
    
    var hotel: Hotel? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Rooms"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = hotel?.rooms.count {
            return count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? RoomCell {
            if let hotel = self.hotel {
                cell.setupCell(room: hotel.rooms[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let detailVC = segue.destination as? DetailViewController {
                guard let index = tableView.indexPathForSelectedRow?.row else { return }
                detailVC.room = hotel?.rooms[index]
                detailVC.hotelName = hotel?.hotelName
            }
        }
    }
}
