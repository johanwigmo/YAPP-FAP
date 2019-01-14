//
//  MoviesDataProvider.swift
//  14 List
//
//  Created by Johan Wigmo on 2019-01-14.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

protocol MoviesDataProviderDelegate: class {
    func didSelect(movie: Movie)
    func didScroll(to y: CGFloat)
    func didEndDraggingOrDecelerating(y: CGFloat)
}

class MoviesDataProvider: NSObject {

    var toSee: [Movie] = []
    var hasSeen: [Movie] = []
    
    weak var delegate: MoviesDataProviderDelegate?
    
    init(movies: [Movie]) {
        super.init()
        
        for movie in movies {
            if movie.hasSeen {
                hasSeen.append(movie)
            } else {
                toSee.append(movie)
            }
        }
        
    }
    
}

extension MoviesDataProvider: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "To see" : "Has seen"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return toSee.count
        } else {
            return hasSeen.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        
        let movie = indexPath.section == 0 ? toSee[indexPath.row] : hasSeen[indexPath.row]
        cell.config(with: movie)
        
        return cell
    }
    
}

extension MoviesDataProvider: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let movie = indexPath.section == 0 ? toSee[indexPath.row] : hasSeen[indexPath.row]
        delegate?.didSelect(movie: movie)
        
//        if indexPath.section == 0 {
//            let movie = toSee.remove(at: indexPath.row)
//            hasSeen.insert(movie, at: 0)
//            tableView.moveRow(at: indexPath, to: IndexPath(row: 0, section: 1))
//        } else {
//            let movie = hasSeen.remove(at: indexPath.row)
//            toSee.insert(movie, at: 0)
//            tableView.moveRow(at: indexPath, to: IndexPath(row: 0, section: 0))
//        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let movie = sourceIndexPath.section == 0 ? toSee.remove(at: sourceIndexPath.row) : hasSeen.remove(at: sourceIndexPath.row)
        
        if destinationIndexPath.section == 0 {
            toSee.insert(movie, at: destinationIndexPath.row)
        } else {
            hasSeen.insert(movie, at: destinationIndexPath.row)
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        _ = indexPath.section == 0 ? toSee.remove(at: indexPath.row) : hasSeen.remove(at: indexPath.row)
        
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.didScroll(to: scrollView.contentOffset.y)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        delegate?.didEndDraggingOrDecelerating(y: scrollView.contentOffset.y)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        delegate?.didEndDraggingOrDecelerating(y: scrollView.contentOffset.y)
    }
    
}
