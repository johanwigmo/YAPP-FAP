//
//  CoreDataViewController.swift
//  16 Save Data
//
//  Created by Johan Wigmo on 2019-01-16.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let result = try? moc.fetch(Movie.fetchRequest())
        
        if let movies = result as? [Movie] {
            self.movies = movies
        }
        
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = movies[indexPath.row].name
        cell?.detailTextLabel?.text = movies[indexPath.row].year
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "segueShowMovie", sender: movies[indexPath.row])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MovieViewController, let movie = sender as? Movie {
            
            vc.movie = movie
        }
    }
    

}
