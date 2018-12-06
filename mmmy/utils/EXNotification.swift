//
//  EXNotification.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/30.
//  Copyright © 2018 Hoa. All rights reserved.
//

import Foundation
import UIKit

extension Notification
{
    /// 获取keyboard rect
    ///
    /// return 返回当前键盘的CGRect
    func getKeyboardFrame() -> CGRect {
        
        if let userInfo = userInfo {
            if let value = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRect = value.cgRectValue
                return keyboardRect
            }
        }
        return CGRect.zero
    }
    
    /// 获取keyboard弹出/回收时间
    ///
    /// return 键盘弹出或收起的动画时间 defalut is 0.3
    func getKeyboardAnimationDuration() -> TimeInterval {
        
        if let userInfo = userInfo {
            if let value = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval {
                return value
            }
        }
        return TimeInterval(0.3)
    }
    
}
