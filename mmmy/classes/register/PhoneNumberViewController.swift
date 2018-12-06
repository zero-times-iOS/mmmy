//
//  PhoneNumberViewController.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/28.
//  Copyright © 2018 Hoa. All rights reserved.
//

import UIKit

class PhoneNumberViewController: BaseViewController {
    /// 键盘顶部工具栏顶部与area区域的约束 default = -100
    @IBOutlet var keyboardTopViewBottomConstraint: NSLayoutConstraint!
    /// 键盘顶部工具栏
    @IBOutlet var keyboardTopView: UIView!
    /// 键盘顶部继续按钮
    @IBOutlet var continueButtonKeyboard: UIButton!
    /// 标题
    @IBOutlet var displayTitle: UILabel!
    /// 提示信息
    @IBOutlet var displayTipMessage: UILabel!
    /// 电话号码输入框
    @IBOutlet var phoneNumberTextField: UITextField!
    /// 继续按钮
    @IBOutlet var continueButton: UIButton!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == strings.segue.bottomBarIdentifier {
            if let bottomBarVC = segue.destination as? BottomBarViewController {
                bottomBarVC.type = .phone
            }
        }
    }

    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        if identifier == strings.segue.pwdIdentifier {
            UserDefaults.standard.set(phoneNumberTextField.text!, forKey: strings.userKey.phone)
            UserDefaults.standard.synchronize()
        }
        super.performSegue(withIdentifier: identifier, sender: sender)
    }

    override func viewDidLoad() {
        super.addKeyboardObserver()
        super.viewDidLoad()
    }

    override func setupUI() {
        displayTitle?.text                  = "请输入手机号"
        displayTipMessage?.text             = "登录和重设密码时，需要用到此号码。"
        continueButton?.layer.cornerRadius  = 4
        continueButton?.layer.masksToBounds = true
        continueButton?.alpha               = 0
        _ = [continueButtonKeyboard, continueButton].map { button -> Swift.Void in
            button?.setTitle("继续", for: .normal)
        }
        phoneNumberTextField?.becomeFirstResponder()
    }

    override func keyboardWillHide(_ notification: Notification) {
        keyboardTopViewBottomConstraint.constant = -100
        let animateInterval = notification.getKeyboardAnimationDuration()
        UIView.animate(withDuration: animateInterval) {
            self.keyboardTopView.transform.rotated(by: .pi)
            self.view.layoutIfNeeded()
            DispatchQueue.global().async {
                DispatchQueue.main.async {
                    self.continueButton?.alpha    = 1
                    self.displayTipMessage?.alpha = 0
                }
            }
        }
    }

    override func keyboardWillShow(_ notification: Notification) {
        keyboardTopViewBottomConstraint.constant = notification.getKeyboardFrame().size.height - 40
        let animateInterval = notification.getKeyboardAnimationDuration()
        UIView.animate(withDuration: animateInterval) {
            self.keyboardTopView.transform.rotated(by: .pi)
            self.view.layoutIfNeeded()
            DispatchQueue.global().async {
                DispatchQueue.main.async {
                    self.continueButton?.alpha    = 0
                    self.displayTipMessage?.alpha = 1
                }
            }
        }
    }

    /// 点击空白区域手势
    ///
    /// 回收键盘与设置按钮透明度
    ///
    /// - parameter sender: 手势
    @IBAction func tapSpaceClick(_ sender: UITapGestureRecognizer) {
        phoneNumberTextField?.resignFirstResponder()
    }

    /// 动画设置按钮透明度
    ///
    /// 继续按钮alpha为0时 提示label为1
    ///
    /// - parameter alpha:  透明值
    fileprivate func setAlpha(alpha: CGFloat) {
        UIView.animate(withDuration: TimeInterval(0.5)) {
            self.continueButton?.alpha    = alpha
            self.displayTipMessage?.alpha = alpha == 1 ? 0 : 1
        }
    }

    /// 键盘顶部栏继续点击事件
    @IBAction func continueClick(_ sender: UIButton) {
        performSegue(withIdentifier: strings.segue.pwdIdentifier, sender: nil)
    }
}
