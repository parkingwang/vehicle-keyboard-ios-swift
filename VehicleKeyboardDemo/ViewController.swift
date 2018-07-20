//
//  ViewController.swift
//  VehicleKeyboardDemo
//
//  Created by 杨志豪 on 2018/4/8.
//  Copyright © 2018年 yangzhihao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    let handler = PWHandler()

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    @IBOutlet weak var myTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //UITextField绑定车牌键盘(输入框形式)
        self.myTextField.changeToPlatePWKeyBoardInpurView()
        
        //UICollectionView绑定车牌键盘(格子形式)
       handler.setKeyBoardView(collectionView: collectionView)
    }
    

    @IBAction func changeModeButtonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        //uitextField输入框改变新能源
        myTextField.changePlateInputType(isNewEnergy:sender.isSelected)
        
        //格子输入框改变新能源
        handler.changeInputType(isNewEnergy: sender.isSelected)
    }
    

    @IBAction func buttonAction(_ sender: UIButton) {
        self.view.endEditing(false)
    }
    
    @IBAction func testButtonAction(_ sender: UIButton) {
        if !myTextField.isFirstResponder {
            myTextField.becomeFirstResponder()
        }
        count += 1
        print("点击了最下面的按钮\(count)");
    }
    
    @IBAction func setCollectionInputButtonAction(_ sender: UIButton) {
        self.handler.setPlate(plate: "湘JR0001", type: .auto)
    }
    
    @IBAction func setTextFieldPlateButtonAction(_ sender: UIButton) {
        myTextField.setPlate(plate: "粤BR0001", type: .auto)
        
    }
}

