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
    
    
    @IBOutlet weak var displayTipMessage: UILabel!
    
    
    fileprivate var bottomBarVC: BottomBarViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == strings.segue.bottomBarIdentifier {
            bottomBarVC = segue.destination as? BottomBarViewController
            bottomBarVC.type = .sex
        }
    }
    
    
    override func setupUI() {
        displayTipMessage?.text = "你可以稍后在设置中更改。"
    }
    
    @IBAction func sexClick(_ sender: UIButton) {
        UserDefaults.standard.set(sender.tag, forKey: strings.userKey.sex)
        UserDefaults.standard.synchronize()
        performSegue(withIdentifier: strings.segue.phoneIdentifier, sender: nil)
    }
    

}
