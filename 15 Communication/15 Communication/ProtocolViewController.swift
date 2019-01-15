//
//  ProtocolViewController.swift
//  15 Communication
//
//  Created by Johan Wigmo on 2019-01-15.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class ProtocolViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let data: [Vehicle] = [
        Car(color: .yellow, name: "My Car", regNumber: "ABC123"),
        Bike(color: .blue, name: "My Bike"),
        Car(color: .orange, name: "My Car", regNumber: "ABC123"),
        Bike(color: .red, name: "My Bike 2"),
        Bike(color: .green, name: "My Bike 3")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        
        let vehicle = data[indexPath.row]
        cell?.textLabel?.text = vehicle.fullName()
        cell?.detailTextLabel?.text = "Number of tires: \(vehicle.fullName())"
        cell?.backgroundColor = vehicle.color
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vehicle = data[indexPath.row]
        
        if let _ = vehicle as? Car {
            print("This is a car")
        } else {
            print("This is probably a bike")
        }
        
        let typeOfVehicle = type(of: vehicle)
        
        let alert = UIAlertController(title: "Vehicle", message: "\(typeOfVehicle)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
