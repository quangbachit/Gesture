//
//  Item'.swift
//  UIGesture
//
//  Created by Quang Bach on 3/30/17.
//  Copyright © 2017 QuangBach. All rights reserved.
//

import UIKit

class Item: UIImageView, UIGestureRecognizerDelegate {    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    func setupUI() {
        
        self.isUserInteractionEnabled = true
        self.isMultipleTouchEnabled = true
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(onpan(panGesture:)))
        gesture.delegate = self
        self.addGestureRecognizer(gesture)
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchPhoto(pinchGesture:)))
        pinchGesture.delegate = self
        self.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotateItem(rotateGesture:)))
        rotateGesture.delegate = self
        self.addGestureRecognizer(rotateGesture)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
    func onpan(panGesture: UIPanGestureRecognizer) {
        if panGesture.state  == .began || panGesture.state == .changed{
            
            let point = panGesture.location(in: self.superview)
            self.center = point
            
        }
    }
    
    func pinchPhoto(pinchGesture: UIPinchGestureRecognizer) {
        if let view = pinchGesture.view{
            view.transform = CGAffineTransform(scaleX: pinchGesture.scale, y: pinchGesture.scale)
            
        }
    }
    
    func rotateItem(rotateGesture: UIRotationGestureRecognizer){
        if let view = rotateGesture.view {
            view.transform = CGAffineTransform(rotationAngle: rotateGesture.rotation)
        }
    }
}
