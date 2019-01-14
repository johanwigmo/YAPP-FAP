//
//  MovieTableViewCell.swift
//  14 List
//
//  Created by Johan Wigmo on 2019-01-14.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier = "MovieTableViewCell"
    
    class func getNib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    
    func config(with movie: Movie) {
        titleLabel.text = movie.title + " " + movie.year
        ratingLabel.text = "Rating: \(movie.rating)"
        actorsLabel.text = movie.actors.joined(separator: ", ")
    }
    
}
