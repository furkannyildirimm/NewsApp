//
//  NewsCVCell.swift
//  News
//
//  Created by FurkanYıldırım on 14.05.2023.
//

import UIKit
import Alamofire
import SDWebImage

final class NewsCVCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subsectionLabel: UILabel!
    @IBOutlet private weak var outSV: UIStackView!
    @IBOutlet private weak var titleSV: UIStackView!
    private let color = UIColor(hex: "AFD3E2")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newsImageView.layer.cornerRadius = 15
        newsImageView.clipsToBounds = true
        newsImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        outSV.layer.borderWidth = 1
        outSV.layer.borderColor = UIColor.white.cgColor
        outSV.cornerRadius = 15
        
        titleSV.layer.borderWidth = 1
        titleSV.layer.borderColor = UIColor.white.cgColor
        titleSV.cornerRadius = 10
        titleSV.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    // MARK: - Public Methods
    func set(model: NewsResult) {
        
        titleLabel.text = model.title
        subsectionLabel.text = model.byline
        if let urlStr = model.multimedia?.first?.url, let url = URL(string: urlStr) {
            newsImageView.sd_setImage(with: url, completed: nil)
        } else {
            newsImageView.image = nil
        }
    }
}
