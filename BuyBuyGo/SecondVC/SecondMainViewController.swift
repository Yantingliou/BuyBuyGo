//
//  SecondMainViewController.swift
//  BuyBuyGo
//
//  Created by 劉彥廷 on 2018/10/30.
//  Copyright © 2018年 liou. All rights reserved.
//

import UIKit

class SecondMainViewController: UIViewController {

    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
     let useRed = UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 1.0) //黑色
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        adjustBtn(secondBtn)
        adjustBtn(thirdBtn)
        adjustBtn1(firstBtn)
        adjustTextField(firstTextField)
        adjustTextField(secondTextField)
        
    }
    
    @IBAction func menueAction(_ sender: Any) {
        
       
        print("touch")
        self.findHamburguerViewController()?.showMenuViewController()
    }
    
    
    @IBAction func firstBtnAction(_ sender: Any) {
     print(" touch  firstBtn" )
        adjustBtn(secondBtn)
        adjustBtn(thirdBtn)
        firstBtn.backgroundColor = .white
        firstBtn.setTitleColor(.blue, for: .normal)
    }
    
    
    @IBAction func sectiondBtnAction(_ sender: Any) {
        print("touch secondBtn")
        adjustBtn(firstBtn)
        adjustBtn(thirdBtn)
        secondBtn.backgroundColor = .white
        secondBtn.setTitleColor(.blue, for: .normal)
    }
    
    @IBAction func thirdBtnAction(_ sender: Any) {
        print("touch thirdBtnAction")
        adjustBtn(firstBtn)
        adjustBtn(secondBtn)
        thirdBtn.backgroundColor = .white
        thirdBtn.setTitleColor(.blue, for: .normal)

    }
    
    
    func adjustBtn(_ usebtn:UIButton!) {
        usebtn.clipsToBounds = true
        usebtn.layer.cornerRadius = 10
        usebtn.backgroundColor = .black
        usebtn.layer.borderWidth = 2
        let red = UIColor(red: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 1.0) //黑色
        usebtn.layer.borderColor = red.cgColor
        usebtn.setTitleColor(.yellow, for: .normal)
    }

    func adjustBtn1(_ usebtn:UIButton!) {
        
        //預設
        usebtn.clipsToBounds = true
        usebtn.layer.cornerRadius = 10
        usebtn.layer.borderWidth = 2
       
        usebtn.layer.borderColor = useRed.cgColor
    }
    
    func adjustTextField(_ useTextFild:UITextField! ){
        useTextFild.clipsToBounds = true
        useTextFild.layer.borderColor = useRed.cgColor
        useTextFild.layer.borderWidth = 2
        useTextFild.layer.cornerRadius = 10
        
    }
    
}
