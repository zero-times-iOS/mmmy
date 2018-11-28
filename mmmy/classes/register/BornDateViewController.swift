//
//  BornDateViewController.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/27.
//  Copyright © 2018 Hoa. All rights reserved.
//

import UIKit

class BornDateViewController: BaseViewController
{
    /// 显示标题
    @IBOutlet weak var displayTitle: UILabel!
    /// 显示日期
    @IBOutlet weak var displayDate: UILabel!
    /// 显示提示信息
    @IBOutlet weak var displayTipMessage: UILabel!
    /// pickerView father
    @IBOutlet weak var pickerView: UIView!
    /// 继续按钮
    @IBOutlet weak var continueButton: UIButton!
    /// 日期选择
    @IBOutlet weak var datePicker: UIDatePicker!
    /// 继续按钮2
    @IBOutlet weak var mContinueButton: UIButton!
    /// 日期显示
    fileprivate var date: Date! {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let showDate = dateFormatter.string(from: date)
            displayDate?.text = showDate
        }
    }
    /// pickerView 默认显示
    fileprivate var isShow = true;
    fileprivate var bottomBarVC: BottomBarViewController!
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == strings.segue.bottomBarIdentifier {
            bottomBarVC = segue.destination as? BottomBarViewController
            bottomBarVC.type = .bornDate
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == strings.segue.sexChoiseIdentifier {
            UserDefaults.standard.set(displayDate.text!, forKey: strings.userKey.bornDate)
            UserDefaults.standard.synchronize()
        }
        return true
    }
    
    override func setupUI() {
        
        displayTitle?.text = "请输入生日"
        displayTipMessage?.text = "你可以在个人主页设置此信息对哪些人可见。"
        mContinueButton?.alpha = 0
        mContinueButton?.layer.cornerRadius = 4.0
        mContinueButton?.layer.masksToBounds = true
        
        _ = [continueButton,mContinueButton].map { sender -> Swift.Void in
            sender?.setTitle("继续", for: .normal)
        }
        
        date = Date()
    }

    /// 继续按钮点击
    ///
    /// - parameter sender: continue button :to sex choise view controller
    @IBAction func continueClick(_ sender: UIButton) {
        performSegue(withIdentifier: strings.segue.sexChoiseIdentifier, sender: nil)
    }
    
    /// 点击日期框
    ///
    /// - parameter sender: 点击日期框手势
    @IBAction func tapDateClick(_ sender: UITapGestureRecognizer) {
        
        pickerViewShow(true)
    }
    
    /// 点击空白区域
    ///
    /// - parameter sender: 点击空白区域手势
    @IBAction func tapSpaceAreaClick(_ sender: UITapGestureRecognizer) {
        
        pickerViewShow(false)
    }
    
    /// 日期变化回调
    ///
    /// - parameter sender: UIDatePicker
    @IBAction func pickerValueChanged(_ sender: UIDatePicker) {
        date = sender.date
    }
    
    /// 弹出或者隐藏日期父视图
    ///
    /// mContinueButton 随之显示与隐藏
    ///
    /// - parameter flag: true is show , false is hidden
    func pickerViewShow(_ flag: Bool) {
        
        if flag && isShow {
            return
        }
        
        var y: CGFloat = 0
        var continueButtonAlpha: CGFloat = 0
        var displayTipMsgAlpha: CGFloat = 0
        if flag {
            y = self.pickerView.frame.origin.y-self.pickerView.frame.height-60
            continueButtonAlpha = 0
            displayTipMsgAlpha = 1
        }
        else {
            y = self.pickerView.frame.origin.y+self.pickerView.frame.height+60
            continueButtonAlpha = 1
            displayTipMsgAlpha = 0
        }
        
        UIView.animate(withDuration: TimeInterval(0.5)) {
            self.pickerView.frame = CGRect.init(origin: CGPoint.init(x: 0, y: y), size: self.pickerView.frame.size)
            self.mContinueButton.alpha = continueButtonAlpha
            self.displayTipMessage.alpha = displayTipMsgAlpha
            self.isShow = !self.isShow
        }
    }
    
}
