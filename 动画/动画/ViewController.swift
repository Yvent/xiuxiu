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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    let zad = ZTableView(cellStyle:.subtitle , identifier: "sss")
    
    func setupUI()  {
       
        view.addSubview(zad.ZtableView)
        
        zad.ZtableView.frame =  CGRect(x: 150, y: 50, width: 300, height: 400)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
      
        zad.ZdataSource = [[[.imageName:"photo_headappmusic",.detaliStr:"svswevre",.textStr:"cwrverve"],[.imageName:"photo_headappmusic",.detaliStr:"svswevre",.textStr:"cwrverve"],[.imageName:"photo_headappmusic",.detaliStr:"svswevre",.textStr:"cwrverve"],[.imageName:"photo_headappmusic",.detaliStr:"svswevre",.textStr:"cwrverve"],[.imageName:"photo_headappmusic",.detaliStr:"svswevre",.textStr:"cwrverve"]]]
        zad.ZtableView.reloadData()
        
    }
}

