//
//  TitleTextField.swift
//  09 Custom Views
//
//  Created by Johan Wigmo on 2019-01-09.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

@IBDesignable
class TitleTextField: UIView {

    let identifer = "TitleTextField"
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textFieldView: UIView!
    @IBOutlet private weak var textField: UITextField!
    
    @IBInspectable
    var color: UIColor? {
        didSet { textFieldView.backgroundColor = color }
    }
    
    @IBInspectable
    var textFieldColor: UIColor? {
        didSet { textField.textColor = textFieldColor }
    }
    
    @IBInspectable
    var titleText: String? {
        didSet { titleLabel.text = titleText }
    }
    
    @IBInspectable
    var textFieldText: String? {
        didSet { textField.text = textFieldText }
    }
    
    var text: String? {
        get {
            return textField.text
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
        return Bundle(for: TitleTextField.self).loadNibNamed(identifer, owner: self, options: nil)?.first as! UIView
    }

}

extension TitleTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
