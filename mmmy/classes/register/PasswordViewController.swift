//
//  PasswordViewController.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/30.
//  Copyright © 2018 Hoa. All rights reserved.
//

import UIKit

class PasswordViewController: BaseViewController {
    /// 显示标题
    @IBOutlet var displayTitle: UILabel!
    /// 密码输入框
    @IBOutlet var pwdTextField: UITextField!
    /// 继续按钮
    @IBOutlet var continueButton: UIButton!
    /// 显示提示密码信息
    @IBOutlet var displayTipMessage: UILabel!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == strings.segue.bottomBarIdentifier {
            if let bottomBarVC = segue.destination as? BottomBarViewController {
                bottomBarVC.type = .pwd
            }
        }
    }

    override func viewDidLoad() {
        addKeyboardObserver()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupUI() {
        displayTitle?.text                  = "创建密码"
        displayTipMessage?.text             = "请确保密码不少于六个字符，且应包括数字、字母和符号（例如！和&）这些元素"
        continueButton?.layer.cornerRadius  = 4
        continueButton?.layer.masksToBounds = true
        continueButton?.setTitle("继续", for: .normal)
        continueButton?.alpha               = 0
        pwdTextField?.becomeFirstResponder()
        UIView.animate(withDuration: TimeInterval(0.35)) {
            self.view.layoutIfNeeded()
        }
    }

    /// 跳转至完成注册界面
    @IBAction func continueClick(_ sender: UIButton) {
        if pwdTextField.text!.count < 6 {
            pwdTextField.becomeFirstResponder()
            return
        }

        toDoneRegister()
    }

    override func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: notification.getKeyboardAnimationDuration()) {
            self.continueButton?.alpha = 1
        }
    }

    override func keyboardWillShow(_ notification: Notification) {
        UIView.animate(withDuration: notification.getKeyboardAnimationDuration()) {
            self.continueButton?.alpha = 0
        }
    }

    /// 空白区域点击 回收键盘
    @IBAction func spaceClick(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    fileprivate func toDoneRegister() {
        UserDefaults.standard.setValue(pwdTextField.text!, forKey: strings.userKey.pwd)
        UserDefaults.standard.synchronize()
        performSegue(withIdentifier: strings.segue.doneRegiserIdentifier, sender: nil)
    }
}

// MARK: - UITextFieldDelegate

extension PasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text!.count >= 6 {
            toDoneRegister()
            return true
        }
        return false
    }
}
