//
//  FadeSegue.swift
//  24 Animations
//
//  Created by Johan Wigmo on 2019-01-24.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class FadeInSegue: UIStoryboardSegue {

    override func perform() {
        let transition = CATransition()
        
        transition.type = .fade
        source.view.window?.layer.add(transition, forKey: kCATransition)
        source.present(destination, animated: false, completion: nil)
    }
    
}

class FadeOutSegue: UIStoryboardSegue {
    
    override func perform() {
        let transition = CATransition()
        
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transition.type = .fade
        
        source.view.window?.layer.add(transition, forKey: kCATransition)
        source.dismiss(animated: false, completion: nil)
    }
    
}
