//
//  VerticalLabelView.swift
//  09 Custom Views
//
//  Created by Johan Wigmo on 2019-01-09.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

@IBDesignable
class VerticalLabelView: UIView {

    let identifer = "VerticalLabelView"
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    @IBInspectable
    var topTitle: String? {
        didSet {
            topLabel.text = topTitle
        }
    }
    
    @IBInspectable
    var bottomTitle: String? {
        didSet {
            bottomLabel.text = bottomTitle
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
        return Bundle(for: VerticalLabelView.self).loadNibNamed(identifer, owner: self, options: nil)?.first as! UIView
    }

}
