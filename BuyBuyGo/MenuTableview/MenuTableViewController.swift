//
//  MenuTableViewController.swift
//  BuyBuyGo
//
//  Created by 劉彥廷 on 2018/10/25.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit
import Google
import GoogleSignIn

class MenuTableViewController: UIViewController{
    
    let menuInformation = MenuInformationMode()
  
  
    var userNameee: String?

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var userNameLable: UILabel!
    

    let segues = ["1":"FavoriteProductViewController","2":"FavoriteProductViewController"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        userNameLable.text = userNameee

    }
    

    
    func mainNavigationController() -> DLHamburguerNavigationController {
        return self.storyboard?.instantiateViewController(withIdentifier: "DLDemoNavigationViewController") as! DLHamburguerNavigationController
    }


    func guestNeedLogin(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
       
        vc.passUserName = {
            self.userNameLable.text = vc.nameData
        }

        self.present(vc, animated: true) {
        
        }
       
    }
}

extension MenuTableViewController: UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuInformation.menueTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        let imageNmae: String
        cell.menuItemsLable.text = menuInformation.menueTitle[(indexPath.row)]
        imageNmae = menuInformation.imageNmae[(indexPath.row)]
        cell.menuInageView.image = UIImage(named: imageNmae)
        cell.selectionStyle = .none

        return cell
    }
    
    
   
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("toucch is \(indexPath.row)")
        var selectIndexPath: Int
        selectIndexPath = indexPath.row
        
        /* 這裡要先判斷有沒有登入 */
        let hasAuthInKeychain = GIDSignIn.sharedInstance().hasAuthInKeychain()

        switch selectIndexPath {
            
        case 0:
            print("首頁 再一次載入主畫面")
            
        case 1:
            print("我的收藏")
            if hasAuthInKeychain == true {
                changePage(selectIndexPath)
            } else {
                guestNeedLogin()
                nochange()
            }
            
            
        case 2:
            print("歷史收尋紀錄")
            
            if hasAuthInKeychain == true {
//             print(" 我不是遊客")
            } else {
                guestNeedLogin()
                nochange()

            }
            
        case 3:
            print("回饋存摺")
            if hasAuthInKeychain == true {
             print(" 我不是遊客")
            } else {
                guestNeedLogin()
                nochange()
            }
            
        case 4:
            print("設定")
            /*
             這裡會有兩個不同畫面
             */
            
        default:
            print("例外錯誤 selectIndexPath ")
            break
        }
 

        
    }
    
    func changePage(_ selectIndex:Int){
        
        let useIndex = String(selectIndex)
        let nvc = self.mainNavigationController()
        
        if let hamburguerViewController = self.findHamburguerViewController() {
            hamburguerViewController.hideMenuViewControllerWithCompletion({ () -> Void in
                nvc.visibleViewController?.performSegue(withIdentifier: self.segues[useIndex]!, sender: nil)
                hamburguerViewController.contentViewController = nvc
            })
        }
    }
    
    func nochange(){
        let nvc = self.mainNavigationController()
        
        if let hamburguerViewController = self.findHamburguerViewController() {
            hamburguerViewController.hideMenuViewControllerWithCompletion({ () -> Void in
                
                hamburguerViewController.contentViewController = nvc
            })
        }
    }
    
    
}
