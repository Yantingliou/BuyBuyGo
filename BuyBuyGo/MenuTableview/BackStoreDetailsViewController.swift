//
//  BackStoreDetailsViewController.swift
//  BuyBuyGo
//
//  Created by 劉彥廷 on 2018/10/29.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class BackStoreDetailsViewController: UIViewController {

    @IBOutlet weak var detailView: UIImageView!
    
    var imageViewName: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.modalPresentationStyle = .custom

        detailView.image = UIImage.init(named: imageViewName!)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func closeAction(_ sender: Any) {
        
        self.dismiss(animated: true) {
            
        }
    }
}
