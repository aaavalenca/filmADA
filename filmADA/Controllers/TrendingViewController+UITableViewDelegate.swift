//
//  TrendingViewController+UITableViewDelegate.swift
//  filmADA
//
//  Created by aaav on 19/07/22.
//

import UIKit

extension TrendingViewController : UITableViewDelegate {
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie: Movie = trendingMovies[indexPath.item]
        print(movie.title)
        self.performSegue(withIdentifier: "detailSegue", sender: movie)
        
    }
    
}
