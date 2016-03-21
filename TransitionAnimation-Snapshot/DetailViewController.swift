//
//  DetailViewController.swift
//  TransitionAnimation-Snapshot
//
//  Created by yangyu on 16/3/16.
//  Copyright © 2016年 YangYiYu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    lazy var tapGesture: UITapGestureRecognizer = {
    
        let gesture = UITapGestureRecognizer(target: self, action: Selector("backToRootViewController"))
        return gesture
    }()
    
    internal lazy var topImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "picture"))
        view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height / 3)
        view.userInteractionEnabled = true
        view.addGestureRecognizer(self.tapGesture)
        return view
    }()
    
    lazy var textView: UITextView = {
        
        let textView = UITextView(frame: CGRect(x: 15, y: self.topImageView.frame.maxY - 30, width: self.view.bounds.width - 30, height: self.view.bounds.height - self.view.bounds.height / 3))
        textView.backgroundColor = UIColor.whiteColor()
        textView.layer.cornerRadius = 5
        textView.font = UIFont.systemFontOfSize(24)
        textView.allowsEditingTextAttributes = false
        textView.text = "  其实这些都是相对通用的思想，万变不离其宗的还是在开篇里面我提到的那三个角色：数据管理者，数据加工者，数据展示者。这些五花八门的思想，不外乎就是制订了一个规范，规定了这三个角色应当如何进行数据交换。但同时这些也是争议最多的话题，所以我在这里来把几个主流思想做一个梳理，当你在做View层架构时，能够有个比较好的参考\nMVC（Model-View-Controller）是最老牌的的思想，老牌到4人帮的书里把它归成了一种模式，其中Model就是作为数据管理者，View作为数据展示者，Controller作为数据加工者，Model和View又都是由Controller来根据业务需求调配，所以Controller还负担了一个数据流调配的功能。正在我写这篇文章的时候，我看到InfoQ发了这篇文章，里面提到了一个移动开发中的痛点是：对MVC架构划分的理解。我当时没能够去参加这个座谈会，也没办法发表个人意见，所以就只能在这里写写了"
        textView.layer.addAnimation(self.transitionAnimation, forKey: nil)
        return textView;
    
    }()

    lazy var transitionAnimation: CABasicAnimation = {
        
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.duration = 0.5
        animation.fromValue = self.view.bounds.height + 50
        return animation
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.topImageView)
        self.view.addSubview(self.textView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backToRootViewController() {
        self.navigationController?.popViewControllerAnimated(true)
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
