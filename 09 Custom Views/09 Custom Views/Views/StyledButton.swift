//
//  StyledButton.swift
//  09 Custom Views
//
//  Created by Johan Wigmo on 2019-01-09.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

enum StyledButtonStyle: Int {
    case done
    case cancel
    case disabled
}

protocol StyledButtonDelegate: class {
    func didTap()
}

@IBDesignable
class StyledButton: UIView {
    
    let identifer = "StyledButton"
    
    @IBOutlet weak var button: UIButton!
    
    weak var delegate: StyledButtonDelegate?
    
    var style: StyledButtonStyle = .done {
        didSet {
            updateStyle()
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    var isEnabled: Bool {
        get {
            return style != .disabled
        }
        set {
            style = newValue ? .done : .disabled
            updateStyle()
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
        customView.backgroundColor = .clear
        addSubview(customView)
        updateStyle()
    }
    
    private func loadNib() -> UIView {
        return Bundle(for: StyledButton.self).loadNibNamed(identifer, owner: self, options: nil)?.first as! UIView
    }

    private func updateStyle() {
        button.isEnabled = true
        
        switch style {
        case .done:
            backgroundColor = .green
            button.setTitleColor(.white, for: .normal)
            button.setTitle("Done", for: .normal)
        case .cancel:
            backgroundColor = .red
            button.setTitleColor(.black, for: .normal)
            button.setTitle("Cancel", for: .normal)
        case .disabled:
            button.isEnabled = false
            backgroundColor = backgroundColor?.withAlphaComponent(0.5)
        }
        
    }
    
    @IBAction func buttonAction() {
        delegate?.didTap()
    }
    
}
