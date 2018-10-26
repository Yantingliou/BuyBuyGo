//
//  MenuTableViewController.swift
//  BuyBuyGo
//
//  Created by 劉彥廷 on 2018/10/25.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class MenuTableViewController: UIViewController{
    
    let menuInformation = MenuInformationMode()
    enum haveSingin {
        case userHave, guest
    }
  
    
    var login = haveSingin.guest
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    func mainNavigationController() -> DLHamburguerNavigationController {
        return self.storyboard?.instantiateViewController(withIdentifier: "DLDemoNavigationViewController") as! DLHamburguerNavigationController
    }

    
    func guestNeedLogin(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//        self.present(vc, animated: true, completion: nil)
        self.present(vc, animated: true) {
        
        }
        vc.goBackView = {
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
        /* 這裡要先判斷有沒有登入 */
        var selectIndexPath: Int
        selectIndexPath = indexPath.row
        print(selectIndexPath)
        
        
        
       
    
        switch selectIndexPath {
            
        case 0:
            print("首頁 再一次載入主畫面")
            
        case 1:
            print("我的收藏")
            switch login {
                case .guest:
                
                    guestNeedLogin()

                
                case.userHave:
            print("user")
                
            }
            
            
        case 2:
            print("歷史收尋紀錄")
            guestNeedLogin()
            
        case 3:
            print("回饋存摺")
            guestNeedLogin()
            
        case 4:
            print("設定")
            /*
             這裡會有兩個不同畫面
             */
            
        default:
            print("例外錯誤 selectIndexPath ")
            break
        }
 
        let nvc = self.mainNavigationController()

        if let hamburguerViewController = self.findHamburguerViewController() {
            hamburguerViewController.hideMenuViewControllerWithCompletion({ () -> Void in
                //                nvc.visibleViewController.performSegueWithIdentifier(self.segues[indexPath.row], sender: nil)
                
                hamburguerViewController.contentViewController = nvc
                print("=====\(hamburguerViewController)")
            })
        }
//        ============= ==============
        
        /*
        switch login {
            
        case .guest:

            print("跳轉要求登入")
//            let vc = LoginViewController
            

            
        case .userHave:
            print("登入判斷 點那裡")
           
            switch selectIndexPath {
            case 0:
                print("首頁 再一次載入主畫面")
                
            case 1:
                print("我的收藏")
                
                break
            case 2:
                print("歷史收尋紀錄")
                
            case 3:
                print("回饋存摺")
                
            case 4:
                print("設定")
                
            default:
                print("例外錯誤 selectIndexPath ")
                break
            }
            
            
        }
        */
       
     
        
    }
    
    
}
