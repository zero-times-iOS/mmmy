//
//  EXUIViewController.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/30.
//  Copyright © 2018 Hoa. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    
    /// 获取系统键盘所长视图
    ///
    /// 遍历window.subview，根据描述字段判断
//    func keyboardView() -> UIView? {
//        
//        for window in UIApplication.shared.windows {
//            
//            for subview in window.subviews {
//
//                if subview.description.hasPrefix("(lessThen)UIKeyboard") {
//                    return subview
//                }
//            }
//            
//            for subview in window.subviews {
//                let curSystemVersion = (UIDevice.current.systemVersion as NSString).floatValue
//                if curSystemVersion >= 8.0 {
//                    if subview.description.hasPrefix("<UILayoutContainerView") {
//                        return subview
//                    }
//                }
//                else if curSystemVersion >= 3.2 {
//                    if subview.description.hasPrefix("<UIPeripheralHost") {
//                        return subview
//                    }
//                }
//                else if subview.description.hasPrefix("<UIKeyboard") {
//                    return subview
//                }
//            }
//            
//        }
//        
//        return nil
//    }
}
