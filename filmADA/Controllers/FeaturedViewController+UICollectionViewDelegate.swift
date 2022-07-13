//
//  FeaturedViewController+UICollectionViewDelegate.swift
//  filmADA
//
//  Created by aaav on 13/07/22.
//

import Foundation
import UIKit

extension FeaturedViewController: UICollectionViewDelegate{
    
    
    // identifica todas as content views dentro desse view controller
    // e qualquer uma delas em que você apertar, dá uma resposta
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let movie: Movie

        if collectionView == self.popularCollectionView{
            print("popular movie")
            movie = popularMovies[indexPath.item]
        } else if collectionView == self.nowPlayingCollectionView {
            print("now playing movie")
            movie = nowPlayingMovies[indexPath.item]
        } else {
            print("upcoming movie")
            movie = upcomingMovies[indexPath.item]
        }
        
        self.performSegue(withIdentifier: "detailsSegue", sender: movie)
    }
    
}
