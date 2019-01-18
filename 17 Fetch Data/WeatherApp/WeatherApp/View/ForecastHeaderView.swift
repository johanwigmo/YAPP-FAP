//
//  ForecastHeaderView.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-18.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import UIKit

class ForecastHeaderView: UIView {
    
    private var label: UILabel!
    
    var titleText: String = "" {
        didSet {
            label.text = titleText
        }
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
        self.backgroundColor = .clear
        
        label = UILabel()
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.frame = CGRect(x: 15,
                             y: 15,
                             width: bounds.width - 30,
                             height: bounds.height - 20)
        
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.text = titleText
        
        
        addSubview(label)
    }

}
