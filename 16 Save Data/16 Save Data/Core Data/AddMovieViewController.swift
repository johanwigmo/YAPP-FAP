//
//  AddMovieViewController.swift
//  16 Save Data
//
//  Created by Johan Wigmo on 2019-01-16.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit
import CoreData

class AddMovieViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet var actorsTextField: [UITextField]!
    
    @IBAction func save(_ sender: Any) {
        
        guard let name = nameTextField.text, name != "",
            let year = yearTextField.text, year != ""
            else { return }
        
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        guard let movie = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: moc) as? Movie else { return }
        
        movie.name = name
        movie.year = year
        
        for textField in actorsTextField {
            if let name = textField.text, name != "" {
                guard let actor = NSEntityDescription.insertNewObject(forEntityName: "Actor", into: moc) as? Actor else { continue }
                
                actor.name = name
                movie.addToActors(actor)
                (UIApplication.shared.delegate as! AppDelegate).saveContext()
            }
        }
        
        print(movie.actors?.count)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        dismiss(animated: true, completion: nil)
    }
    
}
