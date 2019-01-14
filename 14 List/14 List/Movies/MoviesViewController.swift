//
//  MoviesViewController.swift
//  14 List
//
//  Created by Johan Wigmo on 2019-01-14.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var favoriteTitleLabel: UILabel!
    @IBOutlet weak var favoriteViewHeightConstraint: NSLayoutConstraint!
    
    var movies: [Movie] = MovieFactory.generate()
    
    var dataProvider: MoviesDataProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataProvider = MoviesDataProvider(movies: movies)
        dataProvider?.delegate = self
        
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        
        tableView.register(MovieTableViewCell.getNib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
        
    }
    
    @IBAction func toggleEditMode(_ sender: UIBarButtonItem) {
        tableView.isEditing = !tableView.isEditing
        sender.title = tableView.isEditing ? "Done" : "Edit"
    }
    
}

extension MoviesViewController: MoviesDataProviderDelegate {
    
    func didSelect(movie: Movie) {
        
        favoriteTitleLabel.text = movie.title
        favoriteImageView.image = UIImage(named: movie.genre.rawValue)
        
    }
    
    func didScroll(to y: CGFloat) {
        
        if y < 0 {
            favoriteViewHeightConstraint.constant += abs(y)
        } else if y > 0 && favoriteViewHeightConstraint.constant >= 65 {
            favoriteViewHeightConstraint.constant -= y / 100
            
            if favoriteViewHeightConstraint.constant <= 65 {
                favoriteViewHeightConstraint.constant = 65
            }
        }
        
    }
    
    func didEndDraggingOrDecelerating(y: CGFloat) {
        if favoriteViewHeightConstraint.constant > 150 {
            
            favoriteViewHeightConstraint.constant = 150
            
            UIView.animate(withDuration: 0.4) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
}
