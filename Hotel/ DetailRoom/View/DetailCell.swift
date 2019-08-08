//
//  SliderImageCell.swift
//  Hotel
//
//  Created by Per Pert on 8/7/19.
//  Copyright © 2019 Petro. All rights reserved.
//

import UIKit

class DetailCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setupItem(image: String?) {
        guard let photo = image else { return }
        imageView.image = UIImage(named: photo)
    }
}
