//
//  CornerRadius+Extension.swift
//  News
//
//  Created by FurkanYıldırım on 13.05.2023.
//

import UIKit


extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat{
        get{return self.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}

