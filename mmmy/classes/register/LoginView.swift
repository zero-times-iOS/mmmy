//
//  LoginView.swift
//  mmmy
//
//  Created by 叶长生 on 2018/12/5.
//  Copyright © 2018 Hoa. All rights reserved.
//

import CoreText
import UIKit

class LoginView: UIView {
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        if let context = UIGraphicsGetCurrentContext() {
            
            context.textMatrix = CGAffineTransform.identity
            context.translateBy(x: 0, y: bounds.size.height)
            context.scaleBy(x: 1, y: -1)

            let path = CGMutablePath()
            path.addRect(self.bounds)

            let attString = NSAttributedString.init(string: "Hello world")
            let framesetter = CTFramesetterCreateWithAttributedString(attString as CFAttributedString)
            let frame = CTFramesetterCreateFrame(framesetter, CFRange(location: 0, length: attString.length), path, nil)

            CTFrameDraw(frame, context)
        }
    }
}
