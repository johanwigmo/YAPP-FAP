//
//  LoginViewController.swift
//  09 Custom Views
//
//  Created by Johan Wigmo on 2019-01-09.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: TitleTextField!
    @IBOutlet weak var passwordTextField: TitleTextField!
    @IBOutlet weak var button: StyledButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button.isEnabled = !(usernameTextField.isEmpty || passwordTextField.isEmpty)
        button.delegate = self
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }

}

extension LoginViewController: StyledButtonDelegate {
    
    func didTap() {
        guard let username = usernameTextField.text,
            let password = passwordTextField.text
            else { return }
        print(username + " " + password)
    }
    
}

extension LoginViewController: TitleTextFieldDelegate {
    
    func titleTextFieldDidChange(_ textField: UITextField) {
        button.isEnabled = !(usernameTextField.isEmpty || passwordTextField.isEmpty)
    }
    
}
