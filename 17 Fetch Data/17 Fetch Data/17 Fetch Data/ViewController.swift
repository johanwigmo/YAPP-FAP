//
//  ViewController.swift
//  17 Fetch Data
//
//  Created by Johan Wigmo on 2019-01-17.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue(label: "background").async {
            
            let imageUrl = URL(string: "http://photomakers.org/wp-content/gallery/gestreifte-katzen/gestreifte-katzen-bilder-photomaker-12.jpg")!
            
            if let imageDate = try? Data(contentsOf: imageUrl) {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: imageDate)
                }
            }
        }
        
        
        let textUrl = URL(string: "https://raw.githubusercontent.com/johanwigmo/YAPP-FAP/master/14%20List/14%20List/Movies/movies.json")!
        let text = try? String(contentsOf: textUrl)
        
        textView.text = text
        
        
    }


}

