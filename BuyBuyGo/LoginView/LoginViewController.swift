//
//  LoginViewController.swift
//  BuyBuyGo
//
//  Created by 劉彥廷 on 2018/10/25.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

import Firebase
import GoogleSignIn


class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLogin: UIButton!
    @IBOutlet weak var rightEmailLogin: UIButton!
    
    
   let menuInformationMode = MenuInformationMode()
    
   


   var goBackView: (()->())?
    var passUserName: (()->())?
    var nameData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
     menuInformationMode.adjustView(useView: emailLogin)
     menuInformationMode.adjustView(useView: rightEmailLogin)
     
        
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.uiDelegate = self
    }
    


    
    @IBAction func backAction(_ sender: Any) {
        
        print("back")
        self.dismiss(animated: true) {

        }

    }
    
    
    @IBAction func googleAction(_ sender: Any) {
         GIDSignIn.sharedInstance().signIn()
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
extension LoginViewController: GIDSignInDelegate,GIDSignInUIDelegate {
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error == nil {
            if let useName = user.profile.name {
//                print("useName is : \(useName)") // 泰瑞小六
                nameData = useName
//                print("userID is \(user.userID)") //"103561886863641120899")
//                print("email :\(user.profile.email)") //("msze5189@gmail.com")
                print("\(user.profile.hasImage)") //true
               

                self.dismiss(animated: true) {
                    self.passUserName?()
                }

            } else {
                print("error GoogleLogin \(error.localizedDescription)")
            }
        }
    }
    
}
