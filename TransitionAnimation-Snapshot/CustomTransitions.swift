//
//  CustomTransitions.swift
//  TransitionAnimation-Snapshot
//
//  Created by yangyu on 16/3/17.
//  Copyright © 2016年 YangYiYu. All rights reserved.
//

import UIKit

class CustomTransitions: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as? MainViewController
        let toController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as? DetailViewController
    
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
        
        let container = transitionContext.containerView()
        
        toView?.alpha = 0
        toController?.topImageView.hidden = true
        
        let image: UIImageView = fromController!.selectedCell!.imageView
        
        let snapShotView = image.snapshotViewAfterScreenUpdates(false)
        snapShotView.frame = (container?.convertRect(image.frame, fromView: fromController!.selectedCell))!
        fromController?.selectedCell?.imageView.hidden = true
        
        toView?.frame = transitionContext.finalFrameForViewController(toController!)
        
        container?.addSubview(toView!)
        container?.addSubview(snapShotView)
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { () -> Void in
            
            snapShotView.frame = (container?.convertRect(toController!.topImageView.frame, toView: toView))!
            toView?.alpha = 1
            
            }) { (complect) -> Void in
              
                toController?.topImageView.hidden = false
                fromController?.selectedCell?.imageView.hidden = false
                
                snapShotView.removeFromSuperview()
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
        
    }
    
}
