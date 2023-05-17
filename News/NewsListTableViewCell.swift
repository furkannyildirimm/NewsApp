//
//  NewsListTableViewCell.swift
//  News
//
//  Created by STARK on 13.05.2023.
//

import UIKit
import Alamofire
import SDWebImage

final class NewsListTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var abstractLabel: UILabel!
    @IBOutlet private weak var outSV: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outSV.cornerRadius = 20
        outSV.layer.borderColor = UIColor.white.cgColor
        outSV.layer.borderWidth = 1
    }
    
    func set(model: NewsResult) {
            titleLabel.text = model.title
            abstractLabel.text = model.abstract
            if let urlStr = model.multimedia?.first?.url, let url = URL(string: urlStr) {
                newsImageView.sd_setImage(with: url, completed: nil)
            } else {
                newsImageView.image = nil
            }
        }
    }
    

