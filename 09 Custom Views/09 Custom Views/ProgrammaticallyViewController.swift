//
//  ProgrammaticallyViewController.swift
//  09 Custom Views
//
//  Created by Johan Wigmo on 2019-01-09.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class ProgrammaticallyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let twoSquareView = TwoSquareView(frame: .zero)
        twoSquareView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(twoSquareView)
        
        twoSquareView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        twoSquareView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        twoSquareView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        twoSquareView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}
