//
//  FakeViewController.swift
//  24 Animations
//
//  Created by Johan Wigmo on 2019-01-24.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class FakeViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var centerX: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.alpha = 0
        myView.alpha = 0
        centerX.constant = view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3) {
            self.view.alpha = 1
        }
        
        centerX.constant = 0
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.myView.alpha = 1
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }

    @IBAction func dismiss(_ sender: Any) {
        centerX.constant = view.bounds.width
        UIView.animate(withDuration: 0.3) {
            self.myView.alpha = 0
            self.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 0
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
        
    }
    
}
