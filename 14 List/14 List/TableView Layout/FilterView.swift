//
//  FilterView.swift
//  14 Lists Pre
//
//  Created by Johan Wigmo on 2019-01-14.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

protocol FilterViewDelegate: class {
    func didSelect(type: FilterType)
}

class FilterView: UIView {
    
    let identifier = "FilterView"

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    weak var delegate: FilterViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        let customView = loadNib()
        customView.frame = self.bounds
        customView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(customView)
        
        select(button: leftButton)
    }
    
    private func loadNib() -> UIView {
        return Bundle(for: FilterView.self).loadNibNamed(identifier, owner: self, options: nil)?.first as! UIView
    }
    
    private func select(button: UIButton) {
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    }
    
    private func deselect(button: UIButton) {
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender {
        case leftButton:
            select(button: leftButton)
            deselect(button: rightButton)
            delegate?.didSelect(type: .list)
            
        case rightButton:
            select(button: rightButton)
            deselect(button: leftButton)
            delegate?.didSelect(type: .grouped)
            
        default: break
        }
    }

}
