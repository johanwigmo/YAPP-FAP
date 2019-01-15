//
//  CollectionView.swift
//  14 Lists Pre
//
//  Created by Johan Wigmo on 2019-01-14.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

protocol CollectionViewDelegate: class {
    func didUpdateMovieCount(_ count: Int)
    func didSelectt(movie: Movie)
}

class CollectionView: UIView {

    private var collectionView: UICollectionView!
    
    weak var delegate: CollectionViewDelegate?
    
    var movies: [Movie] = [] {
        didSet {
            delegate?.didUpdateMovieCount(movies.count)
        }
    }
    
    var isPagable: Bool = false {
        didSet {
            collectionView.isPagingEnabled = isPagable
        }
    }
    
    convenience init(items: [Movie]) {
        self.init(frame: .zero)
        self.movies = items
    }
    
    func addFavorite(movie: Movie) {
        if let index = movies.index(where: {$0.title == movie.title}) {
            let movie = movies.remove(at: index)
            movies.insert(movie, at: 0)
        } else {
            movies.insert(movie, at: 0)
        }
        
        collectionView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor)
            ])
        
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieCollectionViewCell.getNib(), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
    }

}

extension CollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else { fatalError() }
        
        cell.config(with: movies[indexPath.row])
        
        return cell
    }
    
}

extension CollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        delegate?.didSelectt(movie: movies[indexPath.item])
        
        guard isPagable else { return }
            _ = movies.remove(at: indexPath.item)
            collectionView.reloadData()
    }
    
}
