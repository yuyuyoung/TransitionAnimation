//
//  CustomLayout.swift
//  TransitionAnimation-Snapshot
//
//  Created by yangyu on 16/3/16.
//  Copyright © 2016年 YangYiYu. All rights reserved.
//

import UIKit

class CustomLayout: UICollectionViewFlowLayout {

    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        print(rect)
        
        return super.layoutAttributesForElementsInRect(rect)
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    
}
