//
//  BaseViewController.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/27.
//  Copyright © 2018 Hoa. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewLayout()
    }
    
    func viewLayout() {
    
    }

    /// UI 初始化
    open func setupUI() {

    }
    
    /// UI 更新
    open func updateUI() {
        
    }
    
    /// 添加键盘监听
    open func addKeyboardObserver() {
        
        let selectors = [
            (#selector(keyboardWillShow(_:)),UIResponder.keyboardWillShowNotification),
            (#selector(keyboardWillHide(_:)),UIResponder.keyboardWillHideNotification)]
        
        _ = selectors.map { (selector, noti) -> Swift.Void in
            NotificationCenter.default.addObserver(self, selector: selector, name: noti, object: nil)
        }
    }
    
    /// 键盘回收
    @objc open func keyboardWillHide(_ notification: Notification) {
        
    }
    
    /// 键盘出现
    @objc open func keyboardWillShow(_ notification: Notification) {
        
    }
}
