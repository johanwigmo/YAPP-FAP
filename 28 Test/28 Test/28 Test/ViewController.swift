//
//  ViewController.swift
//  28 Test
//
//  Created by Johan Wigmo on 2019-01-28.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataProviderDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var dataProvider: DataProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if dataProvider == nil {
            dataProvider = DataProvider(manager: DataManager())
        }
        
        dataProvider?.delegate = self
        
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }

    @IBAction func add() {
        guard let text = textField.text else { return }
        textField.text = ""
        dataProvider?.manager.add(text: text)
        textField.resignFirstResponder()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondViewController, let text = sender as? String {
            destination.text = text
        }
    }
    
    func didSelect(text: String) {
        performSegue(withIdentifier: "showSecond", sender: text)
    }
    
}


