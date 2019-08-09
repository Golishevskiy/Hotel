//
//  DetailViewController.swift
//  Hotel
//
//  Created by Per Pert on 8/7/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var categoryRoomLabel: UILabel!
    @IBOutlet weak var descriptionRoomLabel: UILabel!
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    var room: Room?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "№"+(room?.roomNumber.description)!
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
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
}

