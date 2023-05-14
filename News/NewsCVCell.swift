//
//  NewsCVCell.swift
//  News
//
//  Created by STARK on 14.05.2023.
//

import UIKit
import Alamofire
import SDWebImage

final class NewsCVCell: UICollectionViewCell {
    
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subsectionLabel: UILabel!
    @IBOutlet weak var outSV: UIStackView!
    @IBOutlet weak var titleSV: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newsImageView.layer.cornerRadius = 15
        newsImageView.clipsToBounds = true
        newsImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        outSV.layer.borderWidth = 1
        outSV.layer.borderColor = UIColor.black.cgColor
        outSV.cornerRadius = 15
        
        titleSV.layer.borderWidth = 1
        titleSV.layer.borderColor = UIColor.black.cgColor
        titleSV.cornerRadius = 10
        titleSV.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
    }
    
    func set(model: NewsResult) {
        
        titleLabel.text = model.title
        subsectionLabel.text = model.subsection
        if let urlStr = model.multimedia?.first?.url, let url = URL(string: urlStr) {
            newsImageView.sd_setImage(with: url, completed: nil)
        } else {
            newsImageView.image = nil
        }
    }
}
