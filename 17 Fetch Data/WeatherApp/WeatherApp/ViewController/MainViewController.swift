//
//  MainViewController.swift
//  WeahterApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    private let manager = CityManager.shared
    private var dataProvider: MainDataProvider?
    
    lazy var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.tintColor = .black
        control.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        
        manager.delegate = self
        dataProvider = MainDataProvider(cityManager: manager)
        
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        tableView.register(MainCityCell.getNib(), forCellReuseIdentifier: MainCityCell.identifier)
        
        tableView.addSubview(refreshControl)
        showTableViewIfNeeded()
    }
    
    private func addBackground() {
        guard let image = UIImage(named: "background") else { fatalError() }
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(imageView, at: 0)
    }
    
    private func showTableViewIfNeeded() {
        tableView.isHidden = manager.cityCount == 0
        addButton.isHidden = manager.cityCount != 0
        tableView.reloadData()
    }
    
    @objc
    func refresh() {
        manager.refreshWeatherForAllCities {
            self.refreshControl.endRefreshing()
        }
    }
    
    @IBAction func addCity() {
        let alert = AlertFactory.addCity { (text) in
            guard let city = text else {
                print("No text from Add City Search")
                return
            }
            
            self.manager.addCity(by: city)
        }
        present(alert, animated: true, completion: nil)
    }
    
}

extension MainViewController: CityManagerDelegate {
    
    func cityManagerDidUpdate() {
        showTableViewIfNeeded()
    }
    
}
