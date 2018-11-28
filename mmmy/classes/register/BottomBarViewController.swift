//
//  BottomBarViewController.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/27.
//  Copyright © 2018 Hoa. All rights reserved.
//

import UIKit

class BottomBarViewController: BaseViewController {

    enum FatherType {
        case launch
        case named
        case bornDate
        case sex
        case phone
        case none
    }
    
    var type = FatherType.none
    
    /// 跳转登录界面按钮
    @IBOutlet weak var hasAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupUI() {
        hasAccountButton?.setTitle("有账户了?", for: .normal)
    }
    
    /// 按钮点击事件
    ///
    /// 根据传入FatherType，执行不同方法
    ///
    /// - parameter sender: is hasAccountButton
    @IBAction func hasAccountClick(_ sender: UIButton) {
        
        switch type {
        case .launch:
            performSegue(withIdentifier: strings.segue.toLoginIdentifier, sender: nil)
            break
        case .named:
            performSegue(withIdentifier: strings.segue.toLoginIdentifier, sender: nil)
            break
        case .bornDate:
            presentAlertController()
            break
        case .sex:
            presentAlertController()
            break
        case .phone:
            presentAlertController()
            break
        default:
            break
        }
    }
    
    /// 弹出提示框
    ///
    /// 选择继续注册，或者跳转登录
    fileprivate func presentAlertController() {
        
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
