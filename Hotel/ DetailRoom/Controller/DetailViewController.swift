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
    }
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(room?.image?.count)
        return room?.image?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let item = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? DetailCell {
            item.setupItem(image: room?.image?[indexPath.item])
            return item
        }
        return UICollectionViewCell()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x/scrollView.frame.width
        pageControll.currentPage = Int(page)
    }
}
