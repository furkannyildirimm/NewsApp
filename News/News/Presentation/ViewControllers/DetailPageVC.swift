//
//  DetailPageVC.swift
//  News
//
//  Created by FurkanYıldırım on 13.05.2023.
//

import UIKit
import SDWebImage
import SafariServices

final class DetailPageVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var newsImageView: UIImageView!
    @IBOutlet private weak var newsTitleLabel: UILabel!
    @IBOutlet private weak var newsAbstractLabel: UILabel!
    @IBOutlet private weak var bylineLabel: UILabel!
    
    // MARK: - Properties
    private var model: NewsResult?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let model = model else { return }
        newsImageView.sd_setImage(with: URL(string: model.multimedia?.first?.url ?? ""), completed: nil)
        newsTitleLabel.text = model.title
        newsAbstractLabel.text = model.abstract
        bylineLabel.text = model.byline
    }
    
    func set(model: NewsResult) {
        self.model = model
    }
    
    // MARK: - Action
    @IBAction func openInSafariButtonTapped(_ sender: UIButton) {
        guard let urlString = model?.url,
              let url = URL(string: urlString) else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
}
