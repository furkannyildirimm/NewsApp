//
//  CategoryCVCell.swift
//  News
//
//  Created by STARK on 16.05.2023.
//

import UIKit

final class CategoryCVCell: UICollectionViewCell {
    
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var outSV: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outSV.cornerRadius = 5
        outSV.layer.borderColor = UIColor.black.cgColor
        outSV.layer.borderWidth = 1
    }
    
    func configure(category: String, isSelected: Bool) {
        categoryLabel.text = category.uppercased()
        
        outSV.backgroundColor = (isSelected) ? UIColor.red : UIColor.white
    }
}
