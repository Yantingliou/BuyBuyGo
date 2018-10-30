//
//  MoreSpecialCollectionView.swift
//  BuyBuyGo
//
//  Created by 劉彥廷 on 2018/10/30.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class MoreSpecialCollectionView: UIViewController {

    var data = DataImformation()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "最殺特賣"
    
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
extension MoreSpecialCollectionView: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.firstArrayData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionView = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreSpecialCollectionViewCell", for: indexPath) as! MoreSpecialCollectionViewCell
        
        collectionView.moreSpecialView.image = UIImage(named: data.firstArrayData[indexPath.row])
        return collectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MoreSpecialDetailsVC") as! MoreSpecialDetailsVC
        vc.selectIndex = indexPath.row
        self.present(vc,animated: true)
        
    }
    
    
}
