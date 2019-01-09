//
//  HorizontalLabelView.swift
//  09 Custom Views
//
//  Created by Johan Wigmo on 2019-01-09.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

@IBDesignable
class HorizontalLabelView: UIView {

    let identifer = "HorizontalLabelView"
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBInspectable
    var leftTitle: String? {
        didSet {
            leftLabel.text = leftTitle
        }
    }
    
    @IBInspectable
    var rightTitle: String? {
        didSet {
            rightLabel.text = rightTitle
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
        return Bundle(for: HorizontalLabelView.self).loadNibNamed(identifer, owner: self, options: nil)?.first as! UIView
    }

}
