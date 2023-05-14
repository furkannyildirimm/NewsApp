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
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var outSV: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        outSV.cornerRadius = 20
        outSV.layer.borderColor = UIColor.black.cgColor
        outSV.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
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
    

