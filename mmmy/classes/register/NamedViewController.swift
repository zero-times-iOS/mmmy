//
//  NamedViewController.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/27.
//  Copyright © 2018 Hoa. All rights reserved.
//

import UIKit

class NamedViewController: BaseViewController {
    /// 显示标题
    @IBOutlet var displayTitle: UILabel!
    /// 姓输入框
    @IBOutlet var nameTextField: UITextField!
    /// 名输入框
    @IBOutlet var subNameTextField: UITextField!
    /// 提示语
    @IBOutlet var displayTip: UILabel!
    /// 继续按钮
    @IBOutlet var continueButton: UIButton!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == strings.segue.bottomBarIdentifier {
            if let bottomBarVC = segue.destination as? BottomBarViewController {
                bottomBarVC.type = .named
            }
        }
    }

    override func viewDidLoad() {
        super.addKeyboardObserver()
        super.viewDidLoad()
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == strings.segue.toBornDateIdentifier {
            if let textField = nameTextField.text!.count == 0 ? nameTextField : subNameTextField.text!.count == 0 ? subNameTextField : nil {
                textField.becomeFirstResponder()
                return false
            }
        }

        return true
    }

    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        _ = [(strings.userKey.name, nameTextField.text!), (strings.userKey.subName, subNameTextField.text!)].map { (userKey, value) -> Swift.Void in
            UserDefaults.standard.setValue(value, forKey: userKey)
        }
        UserDefaults.standard.synchronize()
        super.performSegue(withIdentifier: identifier, sender: sender)
    }

    override func setupUI() {
        displayTitle?.text    = "请输入姓名"
        displayTip?.text      = "使用真实姓名可以方便好友找到你。"
        continueButton?.alpha = 0
        continueButton?.setTitle("继续", for: .normal)

        continueButton?.layer.cornerRadius  = 4
        continueButton?.layer.masksToBounds = true

        nameTextField?.delegate    = self
        subNameTextField?.delegate = self

        nameTextField?.becomeFirstResponder()

        addTextFieldTarget()
    }

    /// 点击view手势
    ///
    /// 回收键盘、开启continueButton显示动画
    ///
    /// - parameter  sender : 点击手势
    @IBAction func tapJAction(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    override func keyboardWillHide(_ notification: Notification) {
        let aniTime = notification.getKeyboardAnimationDuration()
        UIView.animate(withDuration: aniTime) {
            self.view.layoutIfNeeded()
            self.continueButton?.alpha = 1
            self.displayTip?.alpha     = 0
        }
    }

    override func keyboardWillShow(_ notification: Notification) {
        let aniTime = notification.getKeyboardAnimationDuration()
        UIView.animate(withDuration: aniTime) {
            self.view.layoutIfNeeded()
            self.continueButton?.alpha = 0
            self.displayTip?.alpha     = 1
        }
    }
}

// MARK: - UITextFieldDelegate

extension NamedViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let anotherTextField = nameTextField == textField ? subNameTextField : nameTextField

        if textField.returnKeyType == .next {
            anotherTextField?.becomeFirstResponder()
        } else if textField.returnKeyType == .go {
            performSegue(withIdentifier: strings.segue.toBornDateIdentifier, sender: nil)
        }

        return true
    }
}

fileprivate extension NamedViewController {
    /// 添加输入框监听
    func addTextFieldTarget() {
        _ = [nameTextField, subNameTextField].map { textField -> Swift.Void in
            textField.addTarget(self, action: #selector(textFieldValueChange(_:)), for: .editingChanged)
        }
    }

    /// 文本框值变化调用方法
    ///
    /// - parameter textField:  值发生变化的输入框
    @objc func textFieldValueChange(_ textField: UITextField) {
        if nameTextField.text!.count > 0 && subNameTextField.text!.count > 0 {
            subNameTextField.returnKeyType = .go
        } else if textField == nameTextField && nameTextField.text!.count == 0 {
            subNameTextField.returnKeyType = .next
        } else if textField == subNameTextField && subNameTextField.text!.count == 0 {
            subNameTextField.returnKeyType = .next
        }

//        UIView.animate(withDuration: TimeInterval(0.3)) {
//
//        }
    }
}
