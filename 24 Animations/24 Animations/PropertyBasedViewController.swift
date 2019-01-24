//
//  PropertyBasedViewController.swift
//  24 Animations
//
//  Created by Johan Wigmo on 2019-01-24.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class PropertyBasedViewController: UIViewController {

    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var leftWidth: NSLayoutConstraint!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var rightWidth: NSLayoutConstraint!
    
    var animator: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        leftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateLeft)))
        rightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateRight)))
    }

    
    
    @objc func animateLeft() {
        
        leftWidth.constant = leftWidth.constant == 100 ? 50 : 100
        UIView.animate(withDuration: 1) {
            self.leftView.backgroundColor = self.leftView.backgroundColor == .black ? .yellow : .black
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc func animateRight() {
        
        if let animator = animator, animator.isRunning {
            animator.stopAnimation(false)
        }
        
        animator?.finishAnimation(at: .current)
        
        rightWidth.constant = rightWidth.constant == 100 ? 50 : 100
        animator = UIViewPropertyAnimator(duration: 2, curve: .easeInOut, animations: {
            self.rightView.backgroundColor = self.rightView.backgroundColor == .black ? .yellow : .black
            
        })
        
        animator?.addAnimations {
            self.view.layoutIfNeeded()
        }
        
        animator?.startAnimation()
    }

}

