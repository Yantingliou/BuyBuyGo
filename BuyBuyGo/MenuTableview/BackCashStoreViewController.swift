//
//  BackCashStoreViewController.swift
//  BuyBuyGo
//
//  Created by 劉彥廷 on 2018/10/29.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class BackCashStoreViewController: UIViewController{

    let dataImformation = DataImformation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension BackCashStoreViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataImformation.backStoreImageName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "BackStoreCashCollectionViewCell", for: indexPath)
            as! BackStoreCashCollectionViewCell
        var useImageName: String?

        useImageName  = dataImformation.backStoreImageName[indexPath.row]
    
        cell.backStoreCashImageView.image =  UIImage(named:useImageName!)

    return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select \(indexPath)")
       let vc = self.storyboard?.instantiateViewController(withIdentifier: "BackStoreDetailsViewController") as! BackStoreDetailsViewController
            vc.imageViewName = dataImformation.backStoreImageName[indexPath.row]
        vc.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)

        self.present(vc, animated: false, completion: nil)
    }
    
}
