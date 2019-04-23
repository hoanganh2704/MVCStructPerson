//
//  BotronImage.swift
//  MVC
//
//  Created by hoanganh on 4/23/19.
//  Copyright © 2019 hoanganh. All rights reserved.
//

import UIKit
// cho phép ảnh thay đổi theo code
@IBDesignable
class BotronImage: UIImageView {
    private var _cornerRadius: CGFloat = 0.0
    // hien thi ra ngoai` storyboard
    @IBInspectable
    var cornerRadius: CGFloat {
        set (newValue) {
            _cornerRadius = newValue
            layer.cornerRadius = frame.size.height / 2
        } get {
            return _cornerRadius
        }
    }
}
