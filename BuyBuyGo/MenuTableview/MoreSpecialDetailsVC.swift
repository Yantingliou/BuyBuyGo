//
//  MoreSpecialDetailsVC.swift
//  BuyBuyGo
//
//  Created by 劉彥廷 on 2018/10/30.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit
import WebKit

class MoreSpecialDetailsVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activeIndicatory: UIActivityIndicatorView!
    
    let useURL = UseURLInformation()
    var selectIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

        let addressURL = URL(string:(useURL.useURLArray[selectIndex]))
        
        
        if let url = addressURL{
            let request = URLRequest(url:url)
            self.webView.addObserver(self, forKeyPath: #keyPath(UIWebView.isLoading), options: .new, context: nil)
            webView.loadRequest(request)
        }
        
     
    
    
  
    
    }
    
    
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


}

extension MoreSpecialDetailsVC: UIWebViewDelegate {
    /*
     增加轉圈圈畫面
     */

    func webViewDidStartLoad(_ webView: UIWebView){
        activeIndicatory.isHidden = false
        activeIndicatory.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView){
        activeIndicatory.stopAnimating()
        activeIndicatory.isHidden = true
    }
    
}
