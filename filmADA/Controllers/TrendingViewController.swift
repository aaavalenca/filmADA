        //
        //  TrendingViewController.swift
        //  filmADA
        //
        //  Created by aaav on 18/07/22.
        //

        import UIKit

        class TrendingViewController: UIViewController {
            
            var trendingMovies : [Movie] = []
            var trendingTodayMovies : [Movie] = []
            var trendingWeekMovies : [Movie] = []
                        
            @IBOutlet var todayTableView: UITableView!
            
            override func viewDidLoad() {
                super.viewDidLoad()
                todayTableView.dataSource = self
                todayTableView.delegate = self
                
                Task {
                        trendingMovies = await Movie.trendingAPI(window: "day")
                        self.todayTableView.reloadData()
                    }
                }
            
            
            @IBAction func didChangeSegment(_ sender: UISegmentedControl){
                if sender.selectedSegmentIndex == 0 {
                    print("1")
                    Task {
                        trendingMovies = await Movie.trendingAPI(window: "day")
                        self.todayTableView.reloadData()
                    }

                } else {
                    print("2")
                    Task {
                        trendingMovies = await Movie.trendingAPI(window: "week")
                        self.todayTableView.reloadData()
                    }
                }
            }
            
        }
