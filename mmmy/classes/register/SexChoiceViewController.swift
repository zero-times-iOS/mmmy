//
//  SexChoiceViewController.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/28.
//  Copyright © 2018 Hoa. All rights reserved.
//

import UIKit

class SexChoiceViewController: BaseViewController
{
    
    /// 显示提示信息
    @IBOutlet weak var displayTipMessage: UILabel!
    @IBOutlet weak var manButton: UIButton!
    @IBOutlet weak var womanButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == strings.segue.bottomBarIdentifier {
            if let  bottomBarVC = segue.destination as? BottomBarViewController {
                bottomBarVC.type = .sex
            }
        }
    }
    
    
    override func setupUI() {
        _ = [manButton,womanButton].map { button -> Swift.Void in
            button?.layer.cornerRadius  = 4
            button?.layer.masksToBounds = true
        }
        displayTipMessage?.text = "你可以稍后在设置中更改。"
    }
    
    /// 性别选择
    ///
    /// - parameter sender: 男 女按钮
    @IBAction func sexClick(_ sender: UIButton) {
        UserDefaults.standard.set(sender.tag, forKey: strings.userKey.sex)
        UserDefaults.standard.synchronize()
        performSegue(withIdentifier: strings.segue.phoneIdentifier, sender: nil)
    }
    

}
