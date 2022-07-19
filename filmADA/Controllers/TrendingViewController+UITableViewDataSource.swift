//
//  TrendingViewController+UITableViewDataSource.swift
//  filmADA
//
//  Created by aaav on 18/07/22.
//

import UIKit

extension TrendingViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingMovies.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = todayTableView.dequeueReusableCell(withIdentifier: TrendingTableViewCell.cellIdentifier, for: indexPath) as? TrendingTableViewCell
        
        let movie = trendingMovies[indexPath.item]
        
        cell?.setup(title: movie.title, year: movie.releaseDate, pImage: UIImage())
        
        Task {
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let image: UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title, year: movie.releaseDate, pImage: image)
        }
    
        return cell ?? TrendingTableViewCell()
    }
    

}
