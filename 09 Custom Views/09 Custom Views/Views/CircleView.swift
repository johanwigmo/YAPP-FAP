//
//  CircleView.swift
//  09 Custom Views
//
//  Created by Johan Wigmo on 2019-01-09.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    
    let identifer = "CircleView"

    @IBOutlet weak var circle: UIView!
    
    @IBInspectable
    var color: UIColor? {
        didSet {
            circle.backgroundColor = color
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
//            circle.layer.cornerRadius = cornerRadius
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        let customView = loadNib()
        customView.frame = self.bounds
        customView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(customView)
    }
    
    private func loadNib() -> UIView {
        return Bundle(for: CircleView.self).loadNibNamed(identifer, owner: self, options: nil)?.first as! UIView
    }
    
}
