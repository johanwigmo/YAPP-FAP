//
//  ListLayoutViewController.swift
//  14 Lists Pre
//
//  Created by Johan Wigmo on 2019-01-14.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class ListLayoutViewController: UIViewController {

    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var favoriteCollectionView: CollectionView!
    @IBOutlet weak var filterView: FilterView!
    @IBOutlet weak var tableView: UITableView!
    
    private var movies = MovieFactory.generate()
    
    private var listDataProvider: ListLayoutDataProvider?
    
    private var filterType: FilterType = .list {
        didSet {
            listDataProvider?.filterType = filterType
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterView.delegate = self
        
        favoriteCollectionView.isPagable = true
        favoriteCollectionView.delegate = self

        listDataProvider = ListLayoutDataProvider(movies: movies)
        listDataProvider?.delegate = self
        
        tableView.dataSource = listDataProvider
        tableView.delegate = listDataProvider
        
        tableView.register(MovieTableViewCell.getNib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.register(MovieCollectionTableViewCell.getNib(), forCellReuseIdentifier: MovieCollectionTableViewCell.identifier)
        
        favoritesLabel.text = "No favorites"
    }
    
}

extension ListLayoutViewController: ListLayoutDataProviderDelegate {
    
    func didSelect(movie: Movie) {
        favoriteCollectionView.addFavorite(movie: movie)
    }
    
}

extension ListLayoutViewController: FilterViewDelegate {
    
    func didSelect(type: FilterType) {
        filterType = type
    }
    
}

extension ListLayoutViewController: CollectionViewDelegate {
    
    func didUpdateMovieCount(_ count: Int) {
        favoritesLabel.text = count == 0 ? "No favorites" : "Favorites: \(count)"
    }
    
    func didSelectt(movie: Movie) { }
    
}
