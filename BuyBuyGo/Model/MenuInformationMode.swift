//
//  MenuInformationMode.swift
//  BuyBuyGo
//
//  Created by 劉彥廷 on 2018/10/25.
//  Copyright © 2018年 liou. All rights reserved.
//

import Foundation
import UIKit

class MenuInformationMode: NSObject {
     let menueTitle = ["首頁","我的收藏","歷史收尋紀錄","回饋存摺","設定"]
    let imageNmae = ["home.jpg","icon_detail_unlike.jpg","icon_nav_qrcode.jpg","icon_show_shopping.jpg","state.jpg"]
    

    func adjustView(useView: UIButton) {
        useView.layer.shadowOffset = CGSize.init(width: 5, height: 5)
        useView.layer.shadowOpacity = 0.7
        useView.layer.shadowRadius = 5
        useView.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
    }
}
