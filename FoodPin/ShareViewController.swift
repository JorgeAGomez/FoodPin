//
//  ShareViewController.swift
//  FoodPin
//
//  Created by Jorge Gomez on 2015-06-30.
//  Copyright (c) 2015 Jorge Gomez. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var backgroundImageView : UIImageView!
    @IBOutlet weak var shareView : UIView!
    
    @IBOutlet weak var facebookIcon : UIView!
    @IBOutlet weak var twitterIcon : UIView!
    @IBOutlet weak var emailIcon : UIView!
    @IBOutlet weak var messageIcon : UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let first = CGAffineTransformMakeScale(0, 0)
        let second = CGAffineTransformMakeTranslation(0,100)
        facebookIcon.transform = CGAffineTransformConcat(first, second)
        twitterIcon.transform = CGAffineTransformConcat(first, second)
        messageIcon.transform = CGAffineTransformConcat(first, second)
        emailIcon.transform = CGAffineTransformConcat(first, second)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.facebookIcon.transform = CGAffineTransformConcat(scale, translate)
        }, completion: nil)
        
        UIView.animateWithDuration(0.7, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.twitterIcon.transform = CGAffineTransformConcat(scale, translate)
        }, completion: nil)
        
        UIView.animateWithDuration(0.7, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.messageIcon.transform = CGAffineTransformConcat(scale, translate)
        }, completion: nil)
        
        UIView.animateWithDuration(0.7, delay: 0.3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: nil, animations: {
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.emailIcon.transform = CGAffineTransformConcat(scale, translate)
        }, completion: nil)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    



}
