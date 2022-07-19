//
//  UpcomingCollectionViewCell.swift
//  filmADA
//
//  Created by aaav on 11/07/22.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "upcomingCell"

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    
    
    func setup(title: String, year: String, image: UIImage){
        titleLabel.text = title
        yearLabel.text = year
        imageView.image = image
    }
    
}
