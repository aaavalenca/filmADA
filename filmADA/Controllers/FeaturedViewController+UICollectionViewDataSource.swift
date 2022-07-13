//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  filmADA
//
//  Created by aaav on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> PopularCollectionViewCell {
        let cell1 = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell
        
        cell1?.titleLabel.text = popularMovies[indexPath.item].title
        cell1?.image.image = UIImage(named: popularMovies[indexPath.item].backdrop)
        
        return cell1 ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ indexPath: IndexPath) -> NowPlayingCollectionViewCell {
        let cell = nowPlayingCollectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell
        
        cell?.titleLabel.text = nowPlayingMovies[indexPath.item].title
        cell?.yearLabel.text = String(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))
        cell?.image.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
        
        return cell ?? NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ indexPath: IndexPath) -> UpcomingCollectionViewCell {
        let cell = upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        
        cell?.titleLabel.text = upcomingMovies[indexPath.item].title
        cell?.yearLabel.text = String(upcomingMovies[indexPath.item].releaseDate.prefix(4))
        cell?.imageView.image = UIImage(named: upcomingMovies[indexPath.item].poster)
        
        return cell ?? UpcomingCollectionViewCell()
    }
    
    
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
    
}
