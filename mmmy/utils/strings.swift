//
//  strings.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/27.
//  Copyright © 2018 Hoa. All rights reserved.
//

import Foundation

public struct strings {
    
    /// ViewController 标识符
    public struct vc {
        /// * Launch Register
        public static let launchRegister = "Launch Register"
        /// * MMMY Tabbar
        public static let mmmyTabbar = "MMMY Tabbar"
    }
    
    /// StoryBoard 标识符
    public struct storyBoard {
        /// * FirstStartMain
        public static let launchStartMain = "FirstStartMain"
        /// * Ground
        public static let ground = "Ground"
    }
    
    /// Segue 标识符
    public struct segue {
        /// * To LoginViewController
        public static let toLoginIdentifier  = "To LoginViewController"
        /// * To Born Date ViewController
        public static let toBornDateIdentifier = "To Born Date"
        /// * Bottom Has Account ViewController
        public static let bottomBarIdentifier = "Bottom Bar"
        /// * To Sex ViewController
        public static let sexChoiseIdentifier = "To Sex"
        /// * To Set Phone
        public static let phoneIdentifier = "To Phone"
        /// * To Set password
        public static let pwdIdentifier = "To Security"
    }
    
    /// 用户标识key
    public struct userKey {
        /// * Name
        public static let name = "Name"
        /// * Sub Name
        public static let subName = "Sub Name"
        /// * Born Date
        public static let bornDate = "Born Date"
        /// * Sex
        public static let sex = "Sex"
        /// * phone
        public static let phone = "Phone"
    }
    
}
