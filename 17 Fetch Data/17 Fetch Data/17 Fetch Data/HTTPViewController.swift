//
//  HTTPViewController.swift
//  17 Fetch Data
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class HTTPViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var effectView: UIVisualEffectView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var movies: [Movie] = []
    
    
    @IBAction func fetchData(_ sender: Any) {
        activityIndicator.startAnimating()
        effectView.isHidden = false
        
        MovieApi.shared.fetchMovies(success: { (movies) in
            self.movies = movies
            self.tableView.reloadData()
            
        }, failure: { (errorMessage) in
            print(errorMessage)
            
        }, always: {
            self.activityIndicator.stopAnimating()
            self.effectView.isHidden = true
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = movies[indexPath.row].title
        cell?.detailTextLabel?.text = movies[indexPath.row].year
        
        return cell!
    }
    

}
