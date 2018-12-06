//
//  DoneRegisterViewController.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/30.
//  Copyright © 2018 Hoa. All rights reserved.
//

import UIKit

class DoneRegisterViewController: BaseViewController {
    @IBOutlet var displayTitle: UILabel!

    @IBOutlet var displayTipMessage: UILabel!

    @IBOutlet var continueButton: UIButton!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == strings.segue.bottomBarIdentifier {
            if let bottomBarVC = segue.destination as? BottomBarViewController {
                bottomBarVC.type = .pwd
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupUI() {
        displayTitle?.text                  = "完成注册"
        displayTipMessage?.text             = "点击注册表示同意接受我们的条款、数据使用政策和Cookie政策。你可能会收到我们的短信通知，并且随时可以退订。"
        continueButton?.layer.cornerRadius  = 4
        continueButton?.layer.masksToBounds = true
        continueButton?.setTitle("注册", for: .normal)
    }

    /// 发送注册
    @IBAction func doneRegisterAction(_ sender: UIButton) {
        let name: String     = UserDefaults.standard.value(forKey: strings.userKey.name) as! String
        let subName: String  = UserDefaults.standard.value(forKey: strings.userKey.subName) as! String
        let bornDate: String = UserDefaults.standard.value(forKey: strings.userKey.bornDate) as! String
        let sex: NSNumber    = UserDefaults.standard.value(forKey: strings.userKey.sex) as! NSNumber
        let phone: String    = UserDefaults.standard.value(forKey: strings.userKey.phone) as! String
        let pwd: String      = UserDefaults.standard.value(forKey: strings.userKey.pwd) as! String

        print("name: \(name)  subName: \(subName)  bornDate: \(bornDate) sex: \(sex.intValue) phone: \(phone) pwd: \(pwd)")
    }
}
