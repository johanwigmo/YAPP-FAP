//
//  CustomCollectionViewController.swift
//  14 List
//
//  Created by Johan Wigmo on 2019-01-14.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class CustomCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var data: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 1...50 {
            data.append(i)
        }
        
        collectionView.dataSource = self
        
    }
    
}

extension CustomCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if let label = cell.viewWithTag(1) as? UILabel {
            label.text = String(data[indexPath.item])
        }
        
        cell.layer.cornerRadius = cell.bounds.width / 2
        cell.clipsToBounds = true
        
        return cell
    }
    
}
