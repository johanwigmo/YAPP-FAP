//
//  KeyboardNotificationViewController.swift
//  15 Communication
//
//  Created by Johan Wigmo on 2019-01-15.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class KeyboardNotificationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldBottomConstraint: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        NotificationCenter.default.removeObserver(self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @objc func willShow(_ notification: Notification) {
        guard let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        textFieldBottomConstraint.constant = frame.cgRectValue.height
        view.layoutIfNeeded()
    }
    
    @objc func willHide(_ notification: Notification) {
        textFieldBottomConstraint.constant = 20
        view.layoutIfNeeded()
    }
    
}
