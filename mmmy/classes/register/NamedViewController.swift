//
//  NamedViewController.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/27.
//  Copyright © 2018 Hoa. All rights reserved.
//

import UIKit

class NamedViewController: BaseViewController
{
    /// 显示标题
    @IBOutlet weak var displayTitle: UILabel!
    /// 姓输入框
    @IBOutlet weak var nameTextField: UITextField!
    /// 名输入框
    @IBOutlet weak var subNameTextField: UITextField!
    /// 提示语
    @IBOutlet weak var displayTip: UILabel!
    /// 跳转登录按钮
    @IBOutlet weak var loginButton: UIButton!
    /// 继续按钮
    @IBOutlet weak var continueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        displayTitle?.text = "请输入姓名"
        displayTip?.text = "使用真实姓名可以方便好友找到你。"
        loginButton?.setTitle("有账户了?", for: .normal)
        continueButton?.alpha = 0;
        continueButton?.setTitle("继续", for: .normal)
        
        continueButton?.layer.cornerRadius = 4
        continueButton?.layer.masksToBounds = true
        
        nameTextField?.delegate = self
        subNameTextField?.delegate = self
        
        nameTextField?.becomeFirstResponder()
    }
    
    /// 点击view手势
    ///
    /// 回收键盘、开启continueButton显示动画
    ///
    /// - parameter  sender : 点击手势
    @IBAction func tapJAction(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        UIView.animate(withDuration: TimeInterval(0.5)) {
            self.continueButton?.alpha = 1
        }
    }
}
// MARK: - UITextFieldDelegate
extension NamedViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.isEqual(nameTextField) {
            nameTextField.resignFirstResponder()
            subNameTextField.becomeFirstResponder()
        }
        else {
            performSegue(withIdentifier: strings.segue.toBornDateIdentifier, sender: nil)
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.isEqual(nameTextField) {
            UIView.animate(withDuration: TimeInterval(0.5)) {
                self.continueButton?.alpha = 0
            }
        }
    }
}
