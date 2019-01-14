//
//  ListViewController.swift
//  14 List
//
//  Created by Johan Wigmo on 2019-01-14.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
    }

    @IBAction func addRow(_ sender: Any) {
        data.append("\(data.count + 1)")
        
        let indexPath = IndexPath(row: data.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .right)
    }
    
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = data[indexPath.row]
        cell?.detailTextLabel?.text = "Hej"
        
        return cell ?? UITableViewCell()
    }
    
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print(indexPath)
    }
    
}
