//
//  RatingView.swift
//  09 Custom Views
//
//  Created by Johan Wigmo on 2019-01-09.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class RatingView: UIView {

    var rating: Double? {
        didSet { update(rating: rating ?? 0) }
    }
    
    private lazy var imageViews: [UIImageView] = {
        var images: [UIImageView] = []
        
        for _ in 0..<5 {
            let imageView = UIImageView(frame: .zero)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            images.append(imageView)
        }
        
        return images
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    convenience init(rating: Double) {
        self.init(frame: .zero)
        self.rating = rating
        update(rating: rating)
        
    }
    
    private func setup() {
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        for imageView in imageViews {
            addSubview(imageView)
        }
    }
    
    private func setupConstraints() {
        for (index, imageView) in imageViews.enumerated() {
            
            imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            
            let centerXConstant = CGFloat((index * 50) - 100)
            
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: centerXConstant).isActive = true
        }
    }
    
    private func update(rating: Double) {
        let roundedRating = rating.round(nearest: 0.5)
        for (index, imageView) in imageViews.enumerated() {
            if roundedRating - Double(index) >= 1 {
                imageView.image = UIImage(named: "star_full")
            } else  if roundedRating - Double(index) <= 0 {
                imageView.image = UIImage(named: "star_empty")
            } else {
                imageView.image = UIImage(named: "star_half")
            }
        }
    }

}

extension Double {
    
    func round(nearest: Double) -> Double {
        let n = 1 / nearest
        let numberToRound = self * n
        return numberToRound.rounded() / n
    }
}
