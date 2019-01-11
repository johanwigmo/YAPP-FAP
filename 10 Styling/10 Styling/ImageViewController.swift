//
//  ImageViewController.swift
//  10 Styling Pre
//
//  Created by Johan Wigmo on 2019-01-09.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var circleImage: UIImageView!
    @IBOutlet weak var shadowImage: UIImageView!
    @IBOutlet weak var filterImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        circleImage.layer.borderColor = UIColor.black.cgColor
        circleImage.layer.borderWidth = 5
        
        shadowImage.layer.shadowColor = UIColor.black.cgColor
        shadowImage.layer.shadowRadius = 10
        shadowImage.layer.shadowOffset = CGSize(width: -10, height: 10)
        shadowImage.layer.shadowOpacity = 0.7
        
        addFilterImage()
    }
    
    private func addFilterImage() {
        guard let cgImage = filterImage.image?.cgImage else { return }
        let inputImage = CIImage(cgImage: cgImage)
        
        guard let filter = CIFilter(name: "CIGaussianBlur") else { return }
        filter.setDefaults()
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        
        let context = CIContext(options: nil)
        guard let outputImage = filter.outputImage else { return }
        
        guard let outputCgImage = context.createCGImage(outputImage, from: inputImage.extent) else { return }
        
        filterImage.image = UIImage(cgImage: outputCgImage)
    }
    

}
