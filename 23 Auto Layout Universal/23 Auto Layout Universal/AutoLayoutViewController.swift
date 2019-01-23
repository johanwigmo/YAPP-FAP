//
//  AutoLayoutViewController.swift
//  23 Auto Layout Universal
//
//  Created by Johan Wigmo on 2019-01-23.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    func transform(for translation: CGPoint) -> CGAffineTransform {
        let moveBy = CGAffineTransform(translationX: translation.x, y: translation.y)
        let rotation = -sin(translation.x / (cardView.frame.width * 4.0))
        return moveBy.rotated(by: rotation)
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .changed:
            let translation = sender.translation(in: view)
            cardView.transform = transform(for: translation)
            
        case .ended:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1.0, options: [], animations: {
                self.cardView.transform = .identity
            }, completion: nil)
            
        default: break
        }
        
    }

}
