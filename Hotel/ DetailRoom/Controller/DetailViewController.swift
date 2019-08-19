//
//  DetailViewController.swift
//  Hotel
//
//  Created by Per Pert on 8/7/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var reserveButton: UIButton!
    @IBOutlet weak var categoryRoomLabel: UILabel!
    @IBOutlet weak var descriptionRoomLabel: UILabel!
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    var room: Room?
    var hotelName: String!
    var user: User! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "№"+(room?.roomNumber.description)!
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if SessionUser.shared.user != nil {
            self.user = SessionUser.shared.user
        }
        
        
        if (room?.roomIsFree)! {
            descriptionRoomLabel.backgroundColor = .green
            descriptionRoomLabel.text = room?.roomDescription
        } else {
            descriptionRoomLabel.backgroundColor = .red
            descriptionRoomLabel.text = room?.roomDescription
        }
        
        if room?.image?.count == 1 {
            pageControll.isHidden = true
        } else {
            pageControll.numberOfPages = room?.image?.count ?? 0
        }
        
        categoryRoomLabel.text = room?.roomCategory.rawValue
    }
    
    @IBAction func reserveButton(_ sender: UIButton) {
        checkMoney(user: user, priceRoom: (room?.roomPrice)!)

        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOrderSegue" {
            if let orderVC = segue.destination as? OrderViewController {
                orderVC.room = room
                orderVC.hotelName = hotelName
            }
        }
    }
    
    func checkMoney(user: User, priceRoom: String) {
        let roomPrice = Int(priceRoom) ?? 0
        if user.balance >= roomPrice {
            performSegue(withIdentifier: "toOrderSegue", sender: Any?.self)
        } else {
            UIAlertController.alert(title: "Oops", msg: "Replenish your account", target: self)
        }
        
    }
}

