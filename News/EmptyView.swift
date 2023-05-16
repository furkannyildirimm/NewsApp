//
//  EmptyView.swift
//  News
//
//  Created by STARK on 15.05.2023.
//

import Foundation
import UIKit

@IBDesignable

final class EmptyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    func initView(){
        let viewXib = Bundle.main.loadNibNamed("EmptyView", owner: self, options: nil)?[0] as! UIView
        viewXib.frame = self.bounds
        addSubview(viewXib)
    }
}


