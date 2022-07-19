//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  filmADA
//
//  Created by aaav on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == self.popularCollectionView{
            return makePopularCell(indexPath)
        } else if collectionView == self.nowPlayingCollectionView {
            return makeNowPlayingCell(indexPath)
        } else if collectionView == self.upcomingCollectionView {
            return makeUpcomingCell(indexPath)
        } else {
            return UICollectionViewCell()
        }
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell
        
        let movie = popularMovies[indexPath.item]
        
        cell?.setup(title: movie.title, image: UIImage())

        
        Task{
            let imageData = await Movie.downloadImageData(withPath: movie.backdropPath)
            let image : UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title, image: image)
        }
        
            
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell
        
        let movie = nowPlayingMovies[indexPath.item]
        
        let year :  String = String(movie.releaseDate.prefix(4))
        
        cell?.setup(title: movie.title, year: year, image: UIImage())

        
        Task{
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let image : UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title, year: year, image: image)
        }
    
        return cell ?? NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        
        let movie = upcomingMovies[indexPath.item]
        
        let year : String = String(movie.releaseDate.prefix(4))
        
        
        cell?.setup(title: movie.title, year: year, image: UIImage())

        Task{
            let imageData = await Movie.downloadImageData(withPath: movie.posterPath)
            let image : UIImage = UIImage(data: imageData) ?? UIImage()
            cell?.setup(title: movie.title, year: year, image: image)
        }
        
        return cell ?? UpcomingCollectionViewCell()
    }
    
    

    
}
