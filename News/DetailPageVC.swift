//
//  DetailPageVC.swift
//  News
//
//  Created by STARK on 13.05.2023.
//

import UIKit
import Kingfisher

final class DetailPageVC: UIViewController {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsAbstractLabel: UILabel!
    
    var model: NewsResult?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let model = model else { return }
        
        //newsImageView.kf.setImage(with: URL(string: model.multimedia?.first?.url ?? ""))
        
        //newsTitleLabel.text = model.title
        
        //newsAbstractLabel.text = model.abstract
    
    }
    
    func set(model: NewsResult) {
        self.model = model
    }
}
