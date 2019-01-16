//
//  MovieViewController.swift
//  16 Save Data
//
//  Created by Johan Wigmo on 2019-01-16.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        guard let movie = movie else { return }
        
        nameLabel.text = movie.name
        yearLabel.text = movie.year
        
        guard let actors = movie.actors else { return }
        actorsLabel.text = actors.map({ $0 as! Actor })
            .filter({ $0.name != nil })
            .map({ $0.name! })
            .joined(separator: ", ")
    }

}
