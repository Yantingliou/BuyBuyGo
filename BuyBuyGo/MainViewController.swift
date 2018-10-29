//
//  MainViewController.swift
//  BuyBuyGo
//
//  Created by 劉彥廷 on 2018/10/25.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    
    let dataImformation = DataImformation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func leftBtn(_ sender: Any) {
        print("hi")
        self.findHamburguerViewController()?.showMenuViewController()
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
            dataCount = 1
        } else if collectionView == secondCollectionView {
            dataCount = dataImformation.backStoreImageName.count
        }
        return dataCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstCollectionView {
            
        } else if collectionView == secondCollectionView {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as! SecondCollectionViewCell
            cell.secondView.image = UIImage(named:  dataImformation.backStoreImageName[indexPath.row])
           
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BackStoreDetailsViewController") as! BackStoreDetailsViewController
        vc.imageViewName = dataImformation.backStoreImageName[indexPath.row]
        vc.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        self.present(vc, animated: false, completion: nil)
    }
    
}

/*
 主畫面
 */
