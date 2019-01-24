//
//  TransitionViewController.swift
//  24 Animations
//
//  Created by Johan Wigmo on 2019-01-24.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController {
    
    @IBAction func unwindToTransition(_ segue: UIStoryboardSegue) {
        print("Unwinded to Transition")
    }
    
    @IBAction func transition(_ sender: Any) {
        let destination = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DestinationViewController")
        
        let transition = CATransition()
        transition.duration = 1
        transition.type = .reveal
        transition.subtype = .fromTop
        view.window?.layer.add(transition, forKey: kCATransition)
        present(destination, animated: false, completion: nil)   
    }
    
}
