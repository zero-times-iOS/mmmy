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
    
    fileprivate var bottomVC: BottomBarViewController!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == strings.segue.bottomBarIdentifier {
            if let bottomBarVC = segue.destination as? BottomBarViewController {
                bottomBarVC.type = .launch
                bottomVC         = bottomBarVC
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Do any additional setup after loading the view.
    }
    
    override func setupUI() {
        
        startButton?.layer.cornerRadius  = 4.0
        startButton?.layer.masksToBounds = true
        
        startButton?.setTitle("开始", for: .normal)
        let subs = [(displayTitle,"加入 mmmy"),(displaySubTitle,"新建账户，只需要简单几步就搞定了!")]
        DispatchQueue.concurrentPerform(iterations: subs.count) { (index) in
            DispatchQueue.main.async {
                subs[index].0?.text = subs[index].1
            }
        }
        
        UIView.animate(withDuration: TimeInterval(0.35)) {
            self.bottomVC.view.transform.rotated(by: .pi)
            self.bottomVC.view.layoutIfNeeded()
        }
    }
    
}
