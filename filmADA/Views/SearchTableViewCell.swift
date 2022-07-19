//
//  SearchTableViewCell.swift
//  filmADA
//
//  Created by aaav on 19/07/22.
//

import UIKit

class SearchTableViewCell : UITableViewCell {
    static let cellIdentifier = "searchCell"

    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    
    
    func setup(title: String, year : String, pImage: UIImage){
        yearLabel.text = year
        titleLabel.text = title
        posterImage.image = pImage
    }
    
}
