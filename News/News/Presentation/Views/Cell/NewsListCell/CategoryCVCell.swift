//
//  CategoryCVCell.swift
//  News
//
//  Created by FurkanYıldırım on 16.05.2023.
//

import UIKit

final class CategoryCVCell: UICollectionViewCell {
    
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var outSV: UIStackView!
    let color = UIColor(hex: "AFD3E2")

    override func awakeFromNib() {
        super.awakeFromNib()
        outSV.cornerRadius = 15
        outSV.layer.borderColor = UIColor(hex: "AFD3E2").cgColor
        outSV.layer.borderWidth = 1
    }
    
    func configure(category: String, isSelected: Bool) {
        categoryLabel.text = category.uppercased()
        
        outSV.backgroundColor = isSelected ? color : UIColor.white

    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var formattedHex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        if formattedHex.count == 3 {
            formattedHex = formattedHex.map { "\($0)\($0)" }.joined()
        }

        var rgbValue: UInt64 = 0
        Scanner(string: formattedHex).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
