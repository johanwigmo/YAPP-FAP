//
//  ThreeSquareView.swift
//  09 Custom Views
//
//  Created by Johan Wigmo on 2019-01-09.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

@IBDesignable
class ThreeSquareView: UIView {

    private var topView: UIView!
    private var leftView: UIView!
    private var rightView: UIView!
    private var bottomGuide = UILayoutGuide()
    
    @IBInspectable
    var topColor: UIColor? {
        didSet { topView.backgroundColor = topColor }
    }
    
    @IBInspectable
    var leftColor: UIColor? {
        didSet { leftView.backgroundColor = leftColor }
    }
    
    @IBInspectable
    var rightColor: UIColor? {
        didSet { rightView.backgroundColor = rightColor}
    }
    
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
        topView = createView(with: topColor)
        addSubview(topView)
        
        leftView = createView(with: leftColor)
        addSubview(leftView)
        
        rightView = createView(with: rightColor)
        addSubview(rightView)
        
        addLayoutGuide(bottomGuide)
    }
    
    private func createView(with color: UIColor?) -> UIView {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = color
        return view
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            bottomGuide.topAnchor.constraint(equalTo: topView.bottomAnchor),
            bottomGuide.heightAnchor.constraint(equalTo: topView.heightAnchor),
            
            bottomGuide.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomGuide.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomGuide.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            leftView.topAnchor.constraint(equalTo: bottomGuide.topAnchor),
            leftView.bottomAnchor.constraint(equalTo: bottomGuide.bottomAnchor),
            leftView.leadingAnchor.constraint(equalTo: bottomGuide.leadingAnchor),

            leftView.trailingAnchor.constraint(equalTo: rightView.leadingAnchor),
            leftView.widthAnchor.constraint(equalTo: rightView.widthAnchor),

            rightView.topAnchor.constraint(equalTo: bottomGuide.topAnchor),
            rightView.trailingAnchor.constraint(equalTo: bottomGuide.trailingAnchor),
            rightView.bottomAnchor.constraint(equalTo: bottomGuide.bottomAnchor)
            ])
    }

}
