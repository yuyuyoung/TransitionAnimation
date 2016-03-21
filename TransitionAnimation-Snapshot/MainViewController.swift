//
//  MainViewController.swift
//  TransitionAnimation-Snapshot
//
//  Created by yangyu on 16/3/16.
//  Copyright © 2016年 YangYiYu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UINavigationControllerDelegate {
    
    let cell_Width: CGFloat = 300
    
    internal var selectedCell: PictureCollectionViewCell? = nil
    
    lazy var customLayout: CustomLayout = {
        
        let half_Width = self.cell_Width / 2
        
        let layout = CustomLayout()
        layout.itemSize = CGSize(width: self.cell_Width, height: 400)
        layout.scrollDirection = .Horizontal
        layout.minimumInteritemSpacing = 40
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 0, left: self.view.bounds.width / 2 - half_Width, bottom: 0, right: self.view.bounds.width / 2 - half_Width)
        return layout
    }()
    
    lazy var mainCollectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height), collectionViewLayout: self.customLayout)
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerClass(PictureCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    
    lazy var backgroundLayer: CAGradientLayer = {
    
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [UIColor.whiteColor().CGColor as AnyObject, UIColor(red: 10.0 / 256.0, green: 160.0 / 256.0, blue: 200.0 / 256.0, alpha: 1.0).CGColor as AnyObject]
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.layer.addSublayer(self.backgroundLayer)
        self.navigationController?.delegate = self
        
        self.view.addSubview(self.mainCollectionView)
    }

    //MARK:- UICollectionViewDataSource

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! PictureCollectionViewCell
        
        return cell
    }
    

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        self.selectedCell = collectionView.cellForItemAtIndexPath(indexPath) as? PictureCollectionViewCell
        
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
        
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .Push {
            return CustomTransitions()
        }
        return nil
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
