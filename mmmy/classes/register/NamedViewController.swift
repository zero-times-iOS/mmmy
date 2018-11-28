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
    /// 继续按钮
    @IBOutlet weak var continueButton: UIButton!
    fileprivate var bottomBarVC: BottomBarViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == strings.segue.bottomBarIdentifier {
            bottomBarVC = segue.destination as? BottomBarViewController
            bottomBarVC.type = .named
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == strings.segue.toBornDateIdentifier {
            if let textField = nameTextField.text!.count == 0 ? nameTextField : subNameTextField.text!.count == 0 ? subNameTextField : nil {
                
                textField.becomeFirstResponder()
                setAlpha(alpha: 0)
                return false
            }
        }
        
        UserDefaults.standard.setValue(nameTextField.text!, forKey: strings.userKey.name)
        UserDefaults.standard.setValue(subNameTextField.text!, forKey: strings.userKey.subName)
        UserDefaults.standard.synchronize()
        
        return true
    }
    
    override func setupUI() {
        
        displayTitle?.text = "请输入姓名"
        displayTip?.text = "使用真实姓名可以方便好友找到你。"
        continueButton?.alpha = 0;
        continueButton?.setTitle("继续", for: .normal)
        
        continueButton?.layer.cornerRadius = 4
        continueButton?.layer.masksToBounds = true
        
        nameTextField?.delegate = self
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
        setAlpha(alpha: 1)
    }
}
// MARK: - UITextFieldDelegate
extension NamedViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let anotherTextField = nameTextField == textField ? subNameTextField : nameTextField
        
        if textField.returnKeyType == .next {
            textField.resignFirstResponder()
            anotherTextField?.becomeFirstResponder()
        }
        else if textField.returnKeyType == .go {
            performSegue(withIdentifier: strings.segue.toBornDateIdentifier, sender: nil)
        }
    
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        setAlpha(alpha:0)
    }
}
fileprivate extension NamedViewController
{
    /// 动画改变continueButton透明度
    ///
    /// - parameter alpha: 0 - 全透明 1 - 不透明
    func setAlpha(alpha: CGFloat) {
        UIView.animate(withDuration: TimeInterval(0.5)) {
            self.continueButton?.alpha = alpha
            self.displayTip?.alpha = alpha == 0 ? 1 : 0
        }
    }
    
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
            if textField == subNameTextField {
                subNameTextField.resignFirstResponder()
                subNameTextField.becomeFirstResponder()
            }
        }
        else if textField == nameTextField && nameTextField.text!.count == 0 {
            subNameTextField.returnKeyType = .next
            subNameTextField.resignFirstResponder()
            subNameTextField.becomeFirstResponder()
        }
        else if textField == subNameTextField && subNameTextField.text!.count == 0 {
            subNameTextField.returnKeyType = .next
            subNameTextField.resignFirstResponder()
            subNameTextField.becomeFirstResponder()
        }

    }
}
