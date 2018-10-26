//
//  LoginViewController.swift
//  BuyBuyGo
//
//  Created by 劉彥廷 on 2018/10/25.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLogin: UIButton!
    @IBOutlet weak var rightEmailLogin: UIButton!
    
    
   let menuInformationMode = MenuInformationMode()
//   let dLHamburguerContainerViewController = DLHamburguerContainerViewController()
//    let dLHamburguerViewController = DLHamburguerViewController()

   var goBackView: (()->())?

    
    override func viewDidLoad() {
        super.viewDidLoad()

     
     menuInformationMode.adjustView(useView: emailLogin)
     menuInformationMode.adjustView(useView: rightEmailLogin)
     
    }
    


    
    @IBAction func backAction(_ sender: Any) {
        
        print("back")
        self.dismiss(animated: true) {

        }

    }
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
