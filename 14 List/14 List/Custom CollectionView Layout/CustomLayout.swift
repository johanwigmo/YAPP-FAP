//
//  CustomLayout.swift
//  14 List
//
//  Created by Johan Wigmo on 2019-01-14.
//  Copyright © 2019 Newton. All rights reserved.
//

import UIKit

class CustomLayout: UICollectionViewLayout {

    private var cache: [UICollectionViewLayoutAttributes] = []
    
    private var contentHeight: CGFloat = 0
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let inset = collectionView.contentInset
        return collectionView.bounds.width - (inset.right + inset.left)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard cache.isEmpty, let collectionView = collectionView else { return }
        
        let numberOfColumns = 3
        let cellPadding: CGFloat = 6
        let cellHeight: CGFloat = 150
        
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        
        var xOffset: [CGFloat] = [
            0,
            2 * columnWidth,
            columnWidth
        ]
        
        var yOffset: [CGFloat] = []
        var column = 0
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            yOffset.append(2 * cellPadding)
            yOffset.append(2 * cellPadding)
            yOffset.append(cellPadding + cellHeight)
            
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: columnWidth)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            contentHeight = max(collectionView.frame.height, frame.maxY)
            
            yOffset[column] = yOffset[column] + 2 * (cellPadding + cellHeight)
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleAttributes: [UICollectionViewLayoutAttributes] = []
        
        for attribute in cache {
            if attribute.frame.intersects(rect) {
                visibleAttributes.append(attribute)
            }
        }
        
        return visibleAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
    
}
