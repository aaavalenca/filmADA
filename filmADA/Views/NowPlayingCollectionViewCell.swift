//
//  NowPlayingCollectionViewCell.swift
//  filmADA
//
//  Created by aaav on 11/07/22.
//

import UIKit

class NowPlayingCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "nowPlayingCell"

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    
    func setup(title: String, year: String, image: UIImage){
        titleLabel.text = title
        yearLabel.text = year
        imageView.image = image
    }
    
}
