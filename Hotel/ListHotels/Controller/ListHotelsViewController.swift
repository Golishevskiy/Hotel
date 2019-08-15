//
//  ListHotelsViewController.swift
//  Hotel
//
//  Created by Per Pert on 8/3/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import UIKit

class ListHotelsViewController: UITableViewController {
    
    let parse = Parse()
    var model = [Hotel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Out", style: .done, target: self, action: #selector(outUser))

        self.title = "Hotels"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        model = parse.loadJson(filename: "document") ?? [Hotel]()
    }
    
    @objc func outUser() {
        UserDefaults.standard.set(false, forKey: "userLogin")
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? HotelCell {
            let hotelForCell = model[indexPath.row]
            cell.setupCell(hotel: hotelForCell)
            return cell
        }
        return UITableViewCell()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRooms" {
            if let roomVC = segue.destination as? RoomViewController {
                guard let index = tableView.indexPathForSelectedRow?.row else { return }
                roomVC.hotel = model[index]
            }
        }
    } 
}


