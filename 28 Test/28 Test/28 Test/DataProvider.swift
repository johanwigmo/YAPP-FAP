//
//  DataProvider.swift
//  28 Test
//
//  Created by Johan Wigmo on 2019-01-28.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

protocol DataProviderDelegate: class {
    func didSelect(text: String)
}

class DataProvider: NSObject {

    var manager: DataManager
    var delegate: DataProviderDelegate?
    
    init(manager: DataManager) {
        self.manager = manager
    }
    
}

extension DataProvider: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.dataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = manager.text(for: indexPath.row)
        
        return cell
    }
    
}

extension DataProvider: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        delegate?.didSelect(text: manager.text(for: indexPath.row))
    }
    
}
