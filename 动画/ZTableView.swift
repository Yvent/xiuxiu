//
//  ZTableView.swift
//  动画
//
//  Created by 周逸文 on 16/12/28.
//  Copyright © 2016年 xxxx. All rights reserved.
//

import UIKit

public enum ZdataSourceKey: String {
    case imageName = "imageName"
    case textStr     = "textString"
    case detaliStr    = "detaliString"
}

class ZTableView: NSObject , UITableViewDelegate, UITableViewDataSource {
    
    var ZtableView = UITableView()
   
    
    var ZdataSource = [[[ZdataSourceKey: String]]]()
    
    var ZcellStyle:UITableViewCellStyle = .default
    
    var Zidentifier = "ZtableViewCell"
    
    
    init(cellStyle: UITableViewCellStyle,identifier: String) {
        super.init()
        
        ZtableView.delegate = self
        ZtableView.dataSource = self
        
        ZcellStyle = cellStyle
        Zidentifier = identifier
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ZdataSource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ZdataSource[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: ZcellStyle, reuseIdentifier: Zidentifier)
        cell.imageView?.image = UIImage(named: ZdataSource[indexPath.section][indexPath.row][.imageName]!)
        cell.detailTextLabel?.text = ZdataSource[indexPath.section][indexPath.row][.textStr]
        cell.textLabel?.text = ZdataSource[indexPath.section][indexPath.row][.detaliStr]
            
        return cell
    }
    
    
}


