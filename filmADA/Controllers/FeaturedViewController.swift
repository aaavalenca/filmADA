//
//  FeaturedViewController.swift
//  filmADA
//
//  Created by aaav on 04/07/22.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var popularCollectionView: UICollectionView!
    
    @IBOutlet var nowPlayingCollectionView: UICollectionView!
    
    @IBOutlet var upcomingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // quantas células serão exibidas
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as? PopularCollectionViewCell
        cell?.titleLabel.text = "Título do filme"
        cell?.image.image = UIImage()
        
        return cell ?? UICollectionViewCell()
        
    }
    

}

