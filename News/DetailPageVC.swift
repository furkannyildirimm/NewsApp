//
//  DetailPageVC.swift
//  News
//
//  Created by STARK on 13.05.2023.
//

import UIKit
import SDWebImage
import SafariServices

final class DetailPageVC: UIViewController {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsAbstractLabel: UILabel!
    
    var model: NewsResult?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let model = model else { return }
        
        newsImageView.sd_setImage(with: URL(string: model.multimedia?.first?.url ?? ""), completed: nil)
        newsTitleLabel.text = model.title
        newsAbstractLabel.text = model.abstract
    }
    
    func set(model: NewsResult) {
        self.model = model
    }
    @IBAction func openInSafariButtonTapped(_ sender: UIButton) {
        guard let urlString = model?.url,
              let url = URL(string: urlString) else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
}
