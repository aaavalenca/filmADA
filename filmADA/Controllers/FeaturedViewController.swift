//
//  FeaturedViewController.swift
//  filmADA
//
//  Created by aaav on 04/07/22.
//

import UIKit

class FeaturedViewController: UIViewController {
    
    var popularMovies : [Movie] = [] //Movie.popularMovies()
    var nowPlayingMovies : [Movie] = []
    var upcomingMovies : [Movie] = []
//    let nowPlayingMovies = Movie.nowPlayingMovies()
//    let upcomingMovies = Movie.upcomingMovies()
    
    let trendingThisWeekMovies = Movie.trendingThisWeekMovies()
    let trendingTodayMovies = Movie.trendingTodayMovies()
    
    @IBOutlet var popularCollectionView: UICollectionView!
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        
        nowPlayingCollectionView.dataSource = self
        nowPlayingCollectionView.delegate = self
        
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        
        Task{
            popularMovies = await Movie.moviesAPI(section: "popular")
            self.popularCollectionView.reloadData()
            
            nowPlayingMovies = await Movie.moviesAPI(section: "nowPlaying")
            self.nowPlayingCollectionView.reloadData()
            
            upcomingMovies = await Movie.moviesAPI(section: "upcoming")
            self.upcomingCollectionView.reloadData()
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // quantas células serão exibidas
        
        if collectionView == self.popularCollectionView {
            return popularMovies.count
        } else if collectionView == self.nowPlayingCollectionView {
            return nowPlayingMovies.count
        } else if collectionView == self.upcomingCollectionView {
            return upcomingMovies.count
        } else {
            return 0
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            let movie = sender as? Movie
            destination.movie = movie
        }
    }
    
    
}
