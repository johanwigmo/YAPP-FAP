//
//  ListLayoutDataProvider.swift
//  14 Lists Pre
//
//  Created by Johan Wigmo on 2019-01-14.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

protocol ListLayoutDataProviderDelegate: class {
    func didSelect(movie: Movie)
}

class ListLayoutDataProvider: NSObject {
   
    var movies: [Movie] = []
    
    var filterType: FilterType = .list
    
    weak var delegate: ListLayoutDataProviderDelegate?
    
    init(movies: [Movie]) {
        self.movies = movies
        super.init()
    }
    
}

extension ListLayoutDataProvider: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return filterType == .list ? 1 : Genre.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if filterType == .list {
            return nil
        }
        
        return Genre.value(number: section).rawValue.capitalized
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filterType == .list {
            return movies.count
        } else {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if filterType == .list {
            return UITableView.automaticDimension
        } else {
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if filterType == .list {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else {
                fatalError()
            }
            
            cell.config(with: movies[indexPath.row])
            
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCollectionTableViewCell.identifier, for: indexPath) as? MovieCollectionTableViewCell else {
                fatalError()
            }
            
            let genre = Genre.value(number: indexPath.section)
            let filteredMovies = movies.filtered(with: genre)
            cell.config(with: filteredMovies)
            cell.delegate = self
            
            return cell
            
        }
    }
    
}

extension ListLayoutDataProvider: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelect(movie: movies[indexPath.row])
    }
    
}

extension ListLayoutDataProvider: MovieCollectionTableViewCellDelegate {
    
    func didSelect(movie: Movie) {
        delegate?.didSelect(movie: movie)
    }
    
}
