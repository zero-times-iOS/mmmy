//
//  PhoneNumberViewController.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/28.
//  Copyright © 2018 Hoa. All rights reserved.
//

import UIKit

class PhoneNumberViewController: BaseViewController
{
    fileprivate var bottomBarVC: BottomBarViewController!
    
    @IBOutlet weak var displayTitle: UILabel!
    @IBOutlet weak var displayTipMessage: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == strings.segue.bottomBarIdentifier {
            bottomBarVC = segue.destination as? BottomBarViewController
            bottomBarVC.type = .phone
        }
    }
    
    override func setupUI() {
        displayTitle?.text = "请输入手机号"
        displayTipMessage?.text = "登录和重设密码时，需要用到此号码。"
        continueButton?.alpha = 0
        continueButton?.setTitle("继续", for: .normal)
    }
    
    @IBAction func tapSpaceClick(_ sender: UITapGestureRecognizer) {
        
        setAlpha(alpha: 1)
        phoneNumberTextField?.resignFirstResponder()
    }
    
    fileprivate func setAlpha(alpha: CGFloat) {
        
        UIView.animate(withDuration: TimeInterval(0.5)) {
            self.continueButton?.alpha = alpha
            self.displayTipMessage?.alpha = alpha == 1 ? 0 : 1
        }
    }
    
}
extension PhoneNumberViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        setAlpha(alpha: 0)
    }
}
