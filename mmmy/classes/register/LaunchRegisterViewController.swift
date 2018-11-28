//
//  LaunchRegisterViewController.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/27.
//  Copyright © 2018 Hoa. All rights reserved.
//

import UIKit

class LaunchRegisterViewController: BaseViewController
{

    /// 跳转至下一个注册
    @IBOutlet weak var startButton: UIButton!
    /// 显示副标题
    @IBOutlet weak var displaySubTitle: UILabel!
    /// 显示主标题
    @IBOutlet weak var displayTitle: UILabel!
    fileprivate var bottomBarVC: BottomBarViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == strings.segue.bottomBarIdentifier {
            bottomBarVC = segue.destination as? BottomBarViewController
            bottomBarVC.type = .launch
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func setupUI() {
        
        startButton?.layer.cornerRadius = 4.0
        startButton?.layer.masksToBounds = true
        
        startButton?.setTitle("开始", for: .normal)
        displayTitle?.text = "加入 mmmy"
        displaySubTitle?.text = "新建账户，只需要简单几步就搞定了!"
    }
    
}
