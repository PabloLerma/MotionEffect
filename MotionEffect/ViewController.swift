
//
//  ViewController.swift
//  MotionEffect
//
//  Created by Pablo Lerma Martínez on 16/10/15.
//  Copyright © 2015 Pablo Lerma Martínez. All rights reserved.
//

import UIKit

extension UIView {
    func addCustomMotionEffect(relativeValue relativeValue : Float = 20.0) {
        
        let motionEffectX = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis);
        motionEffectX.minimumRelativeValue = -relativeValue;
        motionEffectX.maximumRelativeValue = relativeValue;
        
        let motionEffectY = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis);
        motionEffectY.minimumRelativeValue = -relativeValue;
        motionEffectY.maximumRelativeValue = relativeValue;
        
        let group = UIMotionEffectGroup()
        group.motionEffects = Array(arrayLiteral: motionEffectX, motionEffectY)
        addMotionEffect(group)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var motionView: UIView!
    @IBOutlet weak var textttt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        motionView.addCustomMotionEffect(relativeValue: 40)
        textttt.addCustomMotionEffect(relativeValue: -20)
        
        motionView.layer.shadowColor = UIColor.greenColor().CGColor
        motionView.layer.shadowOpacity = 1.0
        motionView.layer.shadowRadius = 3
        
        addShadowEffect()
    }
    
    func addShadowEffect() {
        let shadowX : CGFloat = 40.0
        let shadowY : CGFloat = 20.0
        
        let motionEffectShadow = UIInterpolatingMotionEffect(keyPath: "layer.shadowOffset", type: .TiltAlongHorizontalAxis);
        motionEffectShadow.minimumRelativeValue = NSValue(CGSize: CGSizeMake(-shadowX, shadowY))
        motionEffectShadow.maximumRelativeValue = NSValue(CGSize: CGSizeMake(shadowX, shadowY))
        motionView.addMotionEffect(motionEffectShadow)
    }
}
