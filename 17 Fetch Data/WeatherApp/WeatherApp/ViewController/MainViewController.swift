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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        
        tableView.isHidden = true
    }
    
    private func addBackground() {
        guard let image = UIImage(named: "background") else { fatalError() }
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.bounds
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(imageView, at: 0)
    }
    
    @IBAction func addCity() {
        let alert = AlertFactory.addCity { (text) in
            guard let city = text else {
                print("No text from Add City Search")
                return
            }
            print(city)
        }
        present(alert, animated: true, completion: nil)
    }
    
}
