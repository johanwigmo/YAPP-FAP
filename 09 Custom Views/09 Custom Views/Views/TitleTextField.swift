//
//  TitleTextField.swift
//  09 Custom Views
//
//  Created by Johan Wigmo on 2019-01-09.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

protocol TitleTextFieldDelegate: class {
    func titleTextFieldDidChange(_ textField: UITextField)
}

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
    var titleTextColor: UIColor? {
        didSet { titleLabel.textColor = titleTextColor }
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
    
    @IBInspectable
    var isSecuredText: Bool = false {
        didSet { textField.isSecureTextEntry = isSecuredText }
    }
    
    var isEmpty: Bool {
        return textField.text?.count ?? 0 == 0
    }
    
    var text: String? {
        get {
            return textField.text
        }
    }
    
    weak var delegate: TitleTextFieldDelegate?
    
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

    @IBAction func textFieldDidChanged(_ sender: UITextField) {
        delegate?.titleTextFieldDidChange(sender)
    }
    
}

extension TitleTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
