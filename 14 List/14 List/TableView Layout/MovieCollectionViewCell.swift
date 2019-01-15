//
//  MovieCollectionViewCell.swift
//  14 Lists Pre
//
//  Created by Johan Wigmo on 2019-01-14.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    static let identifier = "MovieCollectionViewCell"
    
    class func getNib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    func config(with movie: Movie) {
        textLabel.text = movie.title
        switch movie.genre {
        case .action: imageView.image = #imageLiteral(resourceName: "action")
        case .drama: imageView.image = #imageLiteral(resourceName: "drama")
        case .western: imageView.image = #imageLiteral(resourceName: "western")
        case .unknown: imageView.image = #imageLiteral(resourceName: "unknown")
        }
    }
    
}
