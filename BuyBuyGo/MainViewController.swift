//
//  MainViewController.swift
//  BuyBuyGo
//
//  Created by 劉彥廷 on 2018/10/25.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit
import GoogleSignIn

class MainViewController: UIViewController {

    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    @IBOutlet weak var firstView: UILabel!
    @IBOutlet weak var secondView: UILabel!
    @IBOutlet weak var thirdView: UILabel!
    @IBOutlet weak var fourthView: UILabel!
    @IBOutlet weak var fiveView: UILabel!
    
    @IBOutlet weak var searchBtnView: UIButton!
    var titleArray,backCashArray: [String]!
    
    
    let dataImformation = DataImformation()
    var haveLog: String?
    var logis: String?
    
    var userNameLable: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        adjustBtnView(firstView)
        adjustBtnView(secondView)
        adjustBtnView(thirdView)
        adjustBtnView(fourthView)
        adjustBtnView(fiveView)
        adjustBtn(searchBtnView)
//        print(haveLog)
        haveLog = logis
    }
    
    @IBAction func leftBtn(_ sender: Any) {
        print("hi")
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuTableViewController") as! MenuTableViewController
        
       

        let hasAuthInKeychain = GIDSignIn.sharedInstance().hasAuthInKeychain()
        if hasAuthInKeychain == true {
            print(" 我有登入 ")
            vc.userNameee = userNameLable
            self.findHamburguerViewController()?.showMenuViewController()

        } else{
            print(" 我沒有登入 ")
            self.findHamburguerViewController()?.showMenuViewController()
        }

        
    }
    

    
    @IBAction func moreSpeiacl(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MoreSpecialCollectionView") as! MoreSpecialCollectionView
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // Go Secont pagview
    @IBAction func searchViewAction(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondMainViewController") as! SecondMainViewController
        
        navigationController?.pushViewController(vc, animated: true)

        
    }
    
    func adjustBtnView(_ uselable:UILabel! ) {
        uselable.clipsToBounds = true
        uselable.layer.cornerRadius = 15
        uselable.backgroundColor = .clear
        uselable.layer.borderWidth = 2
        let red =
            UIColor(red: 120.0/255.0, green: 150.0/255.0, blue: 200.0/255.0, alpha: 1.0)
        uselable.layer.borderColor = red.cgColor
    }
    
    func adjustBtn(_ uselable:UIButton!) {
        uselable.clipsToBounds = true
        uselable.layer.cornerRadius = 10
//        uselable.backgroundColor = .clear
        uselable.layer.borderWidth = 2
        let red = UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 1.0) //黑色

        uselable.layer.borderColor = red.cgColor
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
 
    
  
}
extension MainViewController :UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var dataCount = 0
        if collectionView == firstCollectionView {
            dataCount = dataImformation.firstArrayData.count
        } else if collectionView == secondCollectionView {
            dataCount = dataImformation.backStoreImageName.count
        }
        return dataCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FirstCollectionViewCell", for: indexPath) as! FirstCollectionViewCell
            cell.firstImageView.image = UIImage(named:  dataImformation.firstArrayData[indexPath.row])
            return cell
        } else if collectionView == secondCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as! SecondCollectionViewCell
            cell.secondView.image = UIImage(named:  dataImformation.backStoreImageName[indexPath.row])
           
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == firstCollectionView {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MoreSpecialDetailsVC") as! MoreSpecialDetailsVC
            vc.selectIndex = indexPath.row
            self.present(vc,animated: false, completion: nil)
            
        } else if collectionView == secondCollectionView {
            
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BackStoreDetailsViewController") as! BackStoreDetailsViewController
        vc.imageViewName = dataImformation.backStoreImageName[indexPath.row]
        vc.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
         titleArray = dataImformation.useData["title"]
        backCashArray = dataImformation.useData["backCrash"]
        vc.backCrash.text =  titleArray[indexPath.row]
        vc.storeTitle.text = backCashArray[indexPath.row]
        self.present(vc, animated: false, completion: nil)
        }
    }
    
}

/*
 主畫面
 */
