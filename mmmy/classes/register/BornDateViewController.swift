//
//  BornDateViewController.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/27.
//  Copyright © 2018 Hoa. All rights reserved.
//

import UIKit

class BornDateViewController: BaseViewController
{

    @IBOutlet weak var hasAccountButton: UIButton!
    
    
    
    
    override func setupUI() {
        hasAccountButton?.setTitle("有账户了?", for: .normal)
    }
    
    /// 点击有账户了按钮
    ///
    /// 弹出选项a框
    ///
    /// - parameter sender: 有账户按钮
    @IBAction func hasAccountClick(_ sender: UIButton) {
        
        let alertViewController = UIAlertController.init(title: "有账户了?", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        let gotoLogAction = UIAlertAction.init(title: "去登录", style: UIAlertAction.Style.destructive, handler: { _ in
            self.performSegue(withIdentifier: strings.segue.toLoginIdentifier, sender: nil)
        })
        
        let continueAction = UIAlertAction.init(title: "继续", style: UIAlertAction.Style.default, handler: { _ in
            
        })

        alertViewController.addAction(gotoLogAction)
        alertViewController.addAction(continueAction)
        present(alertViewController, animated: true)
    }
}
