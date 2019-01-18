//
//  ViewFactory.swift
//  WeatherApp
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Wigmo Productions. All rights reserved.
//

import UIKit

class ViewFactory {
    
    class func background(to view: UIView) -> UIView {
        guard let image = UIImage(named: "background") else { fatalError() }
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.bounds
        print(view.bounds)
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return imageView
    }
}
