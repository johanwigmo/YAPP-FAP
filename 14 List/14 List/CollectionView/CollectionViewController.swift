//
//  CollectionViewController.swift
//  14 List
//
//  Created by Johan Wigmo on 2019-01-14.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var data: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...28 {
            data.append(i)
        }

        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

extension CollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if let label = cell.viewWithTag(1) as? UILabel {
            label.text = String(data[indexPath.item])
        }
        
        return cell
    }
    
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let columns = 3
        let rest = data.count % columns
        
        if rest == 0 || indexPath.item < data.count - rest {
            return itemSize(from: collectionView, with: columns)
        } else {
            return itemSize(from: collectionView, with: rest)
        }
        
    }
    
    private func itemSize(from collectionView: UICollectionView, with columns: Int) -> CGSize {
        let width = collectionView.bounds.width
        let size = floor((width - CGFloat(10 + 10 * columns)) / CGFloat(columns))
        return CGSize(width: size, height: size)
    }
    
}
