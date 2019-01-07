//
//  ListViewController.swift
//  07 Repetition
//
//  Created by Johan Wigmo on 2019-01-07.
//  Copyright © 2019 Johan Wigmo. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var persons: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populatePersons()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func populatePersons() {
        persons.append(Person(firstName: "Johan", lastName: "Wigmo", age: 32, image: UIImage(named: "johanwigmo")))
        persons.append(Person(firstName: "Emma", lastName: "Wigmo", age: 30, image: nil))
        persons.append(Person(firstName: "Saga", lastName: "Wigmo", age: 2, image: nil))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let vc = segue.destination as? DetailViewController,
            let index = sender as? Int
            else { return }
        
        let person = persons[index]
        vc.person = person
    }

}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let person = persons[indexPath.row]
        cell.textLabel?.text = person.firstName
        
        return cell
    }
    
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segueShowDetail", sender: indexPath.row)
    }
    
}
