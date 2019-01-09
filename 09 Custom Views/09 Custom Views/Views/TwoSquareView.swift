//
//  TwoSquareView.swift
//  09 Custom Views
//
//  Created by Johan Wigmo on 2019-01-09.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class TwoSquareView: UIView {
    
    private var leftView: UIView!
    private var rightView: UIView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        createAndAddSubviews()
        setupConstraints()
    }
    
    private func createAndAddSubviews() {
        leftView = createView(with: .red)
        addSubview(leftView)
        
        rightView = createView(with: .blue)
        addSubview(rightView)
    }
    
    private func createView(with color: UIColor) -> UIView {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        return view
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            leftView.topAnchor.constraint(equalTo: topAnchor),
            leftView.bottomAnchor.constraint(equalTo: bottomAnchor),
            leftView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            leftView.trailingAnchor.constraint(equalTo: rightView.leadingAnchor),
            leftView.widthAnchor.constraint(equalTo: rightView.widthAnchor),

            rightView.topAnchor.constraint(equalTo: topAnchor),
            rightView.trailingAnchor.constraint(equalTo: trailingAnchor),
            rightView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
}
