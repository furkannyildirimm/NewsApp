//
//  CornerRadiusExtension.swift
//  News
//
//  Created by STARK on 13.05.2023.
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

