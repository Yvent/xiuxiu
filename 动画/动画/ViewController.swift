//
//  ViewController.swift
//  动画
//
//  Created by 周逸文 on 16/12/15.
//  Copyright © 2016年 xxxx. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    lazy var Btn: UIButton = {
    let btn = UIButton()
        btn.backgroundColor = UIColor(colorLiteralRed: 0, green: 122/255.0, blue: 255/255.0, alpha: 1.0)
        btn.layer.cornerRadius = progressBarHeight
        btn.layer.masksToBounds = true
        return btn
    }()

    
    func setupUI()  {
        view.addSubview(Btn)
        
        Btn.frame = CGRect(x: 150, y: 50, width: progressBarHeight*2, height: progressBarHeight*2)
        
        
        
        Btn.addTarget(self, action: #selector(ViewController.doBtn), for: .touchUpInside)
        
    }
    
    func doBtn() {
        Btn.tapped()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        Btn.recovery()
    }
    
}

