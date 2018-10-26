//
//  FirstMainViewController.swift
//  BuyBuyGo
//
//  Created by 劉彥廷 on 2018/10/25.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class FirstMainViewController: DLHamburguerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func awakeFromNib() {
        self.contentViewController = self.storyboard?.instantiateViewController(withIdentifier: "DLDemoNavigationViewController")
        
        self.menuViewController = self.storyboard?.instantiateViewController(withIdentifier: "MenuTableViewController")
    }
    /*
     try
     */

}
