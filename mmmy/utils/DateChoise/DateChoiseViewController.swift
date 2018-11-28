//
//  DateChoiseViewController.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/28.
//  Copyright © 2018 Hoa. All rights reserved.
//

import UIKit

class DateChoiseViewController: UIViewController
{
    
    fileprivate var block: ((String) -> Swift.Void)!
    fileprivate var topAreaBlock: (() -> Swift.Void)!
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        continueButton.setTitle("继续", for: UIControl.State.normal)
        // Do any additional setup after loading the view.
    }

    /// 继续按钮点击
    ///
    /// - parameter block: 回调block
    func continueClick(block: @escaping (String) -> Swift.Void) {
        
        self.block = block
    }
    
    /// 顶部空白区域点击
    ///
    /// - parameter block: 回调block
    func dismissClick(block: @escaping () -> Swift.Void) {
        
        self.topAreaBlock = block
    }
    
    @IBAction func clickTopArea(_ sender: UIButton) {
        self.topAreaBlock?()
    }
    
    @IBAction func continueClick(_ sender: UIButton) {
        self.block?(datePicker.date.description)
    }
}
