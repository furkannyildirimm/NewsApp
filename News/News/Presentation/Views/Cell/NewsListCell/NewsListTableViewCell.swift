//
//  NewsListTableViewCell.swift
//  News
//
//  Created by FurkanYıldırım on 13.05.2023.
//

import UIKit
import Alamofire
import SDWebImage

final class NewsListTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bylineLabel: UILabel!
    @IBOutlet private weak var outSV: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureOutSV()
    }
    
    // MARK: - Public Methods
    func configureOutSV() {
        outSV.cornerRadius = 20
        outSV.layer.borderColor = UIColor.white.cgColor
        outSV.layer.borderWidth = 1
    }
    
    func set(model: NewsResult) {
        titleLabel.text = model.title
        bylineLabel.text = model.byline
        if let urlStr = model.multimedia?.first?.url, let url = URL(string: urlStr) {
            newsImageView.sd_setImage(with: url, completed: nil)
        } else {
            newsImageView.image = nil
        }
    }
}


