//
//  PictureCollectionViewCell.swift
//  TransitionAnimation-Snapshot
//
//  Created by yangyu on 16/3/17.
//  Copyright © 2016年 YangYiYu. All rights reserved.
//

import UIKit

class PictureCollectionViewCell: UICollectionViewCell {
    
    
    internal lazy var imageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "picture"))
        view.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height / 2)
        return view
    }()
    
    lazy var timeLabel: UILabel = {
    
        let label = UILabel(frame: CGRect(x: 0, y: self.imageView.frame.maxY, width: self.bounds.width, height: 100))
        label.text = "this is a test label"
        label.textAlignment = .Center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.initializeInterface()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        print("\(__FUNCTION__)")
        
    }
    
    func initializeInterface() {
        
        self.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        self.addSubview(self.imageView)
        self.addSubview(self.timeLabel)
    }
}
