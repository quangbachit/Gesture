//
//  ViewController.swift
//  UIGesture
//
//  Created by Quang Bach on 3/30/17.
//  Copyright © 2017 QuangBach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var icon = [#imageLiteral(resourceName: "tat"),#imageLiteral(resourceName: "chuong"),#imageLiteral(resourceName: "qua"),#imageLiteral(resourceName: "caythong"),#imageLiteral(resourceName: "caythongnoel"),#imageLiteral(resourceName: "mu"),#imageLiteral(resourceName: "haquachuong"),#imageLiteral(resourceName: "keo")]
    
    let background: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return imageView
    }()
    
    let removeBtn: UIButton = {
        let button = UIButton()
        button.setTitle("remove", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: .highlighted)
        button.addTarget(self, action: #selector(removeViewImage), for: UIControlEvents.touchUpInside)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 10
        button.frame.size = CGSize(width: 80, height: 20)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    func updateUI(){
        view.addSubview(background)
        
        removeBtn.center = CGPoint(x: self.view.bounds.width - 50, y: self.view.frame.minY + 50)
        view.addSubview(removeBtn)
        
        addSubImge()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap(tapGesture:)))
        
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    
    func onTap(tapGesture: UITapGestureRecognizer){
        let point = tapGesture.location(in: self.view)
        let img = UIImageView(image: UIImage(named: "troll"))
        img.layer.cornerRadius = 10
        img.bounds.size = CGSize(width: 20, height: 20)
        img.center = point
        img.tag = 10
        self.view.addSubview(img)
    }
    
    
    
    func addSubImge(){
        for i in icon {
            let image = Item(frame: CGRect(x: 50, y: 50 + 80 * icon.index(of: i)!, width: 40, height: 40))
            image.image = i
            image.contentMode = .scaleAspectFit
            view.addSubview(image)
        }
    }
    
   
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func removeViewImage(){
        for v in view.subviews {
            if v.tag == 10 {
                v.removeFromSuperview()
            }
        }
    }
    

}

