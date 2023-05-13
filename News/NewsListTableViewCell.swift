//
//  NewsListTableViewCell.swift
//  News
//
//  Created by STARK on 13.05.2023.
//

import UIKit
import Alamofire
import Kingfisher

final class NewsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func set(model: NewsResult) {
        titleLabel.text = model.title
        abstractLabel.text = model.abstract
        newsImageView.kf.setImage(with: URL(string: model.multimedia?.first?.url ?? ""))
    }
    
}
