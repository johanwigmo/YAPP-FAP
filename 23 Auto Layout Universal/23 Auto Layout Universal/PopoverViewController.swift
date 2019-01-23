//
//  PopoverViewController.swift
//  23 Auto Layout Universal
//
//  Created by Johan Wigmo on 2019-01-23.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {

    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        guard let window = (UIApplication.shared.delegate as? AppDelegate)?.window else { return }
        dismissButton.isHidden = view.frame.width != window.frame.width
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
