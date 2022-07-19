//
//  TrendingTableViewCell.swift
//  filmADA
//
//  Created by aaav on 19/07/22.
//

import UIKit

class TrendingTableViewCell: UITableViewCell {
        
    static let cellIdentifier = "trendingCell"
    
    
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    
    func setup(title: String, year : String, pImage: UIImage){
        yearLabel.text = year
        titleLabel.text = title
        posterImage.image = pImage
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
