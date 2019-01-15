//
//  MovieCollectionTableViewCell.swift
//  14 Lists Pre
//
//  Created by Johan Wigmo on 2019-01-14.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

protocol MovieCollectionTableViewCellDelegate: class {
    func didSelect(movie: Movie)
}

class MovieCollectionTableViewCell: UITableViewCell {

    static let identifier = "MovieCollectionTableViewCell"
    
    class func getNib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var collectionView: CollectionView!
    
    weak var delegate: MovieCollectionTableViewCellDelegate?
    
    func config(with movies: [Movie]) {
        collectionView.isPagable = false
        collectionView.movies = movies
        
        collectionView.delegate = self
    }
    
}

extension MovieCollectionTableViewCell: CollectionViewDelegate {
    
    func didSelectt(movie: Movie) {
        delegate?.didSelect(movie: movie)
    }
    
    func didUpdateMovieCount(_ count: Int) { }
    
}
