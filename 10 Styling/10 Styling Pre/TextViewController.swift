//
//  TextViewController.swift
//  10 Styling Pre
//
//  Created by Johan Wigmo on 2019-01-09.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var forthLabel: UILabel!
    
    @IBOutlet weak var firstTextView: UITextView!
    @IBOutlet weak var secondTextView: UITextView!
    @IBOutlet weak var thirdTextView: UITextView!
    
    @IBOutlet weak var secondTextViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupFirstLabel()
        setupThirdLabel()
        setupForthLabel()
        setupSecondTextView()
        setupThirdTextView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let height = secondTextView.contentSize.height
        secondTextViewHeightConstraint.constant = height
    }
    
    private func setupFirstLabel() {
        firstLabel.font = UIFont(name: "Coiny-Regular", size: 20)
        
        for family in UIFont.familyNames {
            print(family)
            for font in UIFont.fontNames(forFamilyName: family) {
                print(font)
            }
            print(" ")
        }
    }
    
    private func setupThirdLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.foregroundColor: UIColor.blue,
            NSAttributedString.Key.underlineColor: UIColor.blue,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedText = NSMutableAttributedString(string: "Hello World!", attributes: attributes)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location: 2, length: 2))
        
        thirdLabel.attributedText = attributedText
    }
    
    private func setupForthLabel() {
        let attributedText = NSMutableAttributedString()
        
        let first = NSAttributedString(string: "Hello ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        attributedText.append(first)
        
        let second = NSAttributedString(string: "World", attributes: [NSAttributedString.Key.foregroundColor: UIColor.blue])
        attributedText.append(second)
        
        let third = NSAttributedString(string: "!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)])
        attributedText.append(third)
        
//        let third = NSAttributedString(string: "!")
//        attributedText.append(third)
//
//        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 30), range: NSRange(location: 0, length: attributedText.length))
        
        forthLabel.attributedText = attributedText
    }
    
    private func setupSecondTextView() {
        secondTextView.backgroundColor = UIColor.red
        let text = "Här kommer lite text med en länk https://www.svt.se där vi även anpassar höjden på vår TextView"
        
        secondTextView.text = text
    }

    private func setupThirdTextView() {
        let html = "<h1>Rubrik</h1><p>Här kommer <b>HTML</b> med <a href=\"https://svt.se\">länk</a>"
        guard  let data = html.data(using: .unicode) else {
            thirdTextView.attributedText = nil
            return
        }
        
        let attributedText = try? NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        
        thirdTextView.attributedText = attributedText
    }
    
}
