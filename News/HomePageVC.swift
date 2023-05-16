//
//  HomePageVC.swift
//  News
//
//  Created by STARK on 14.05.2023.
//

import UIKit

final class HomePageVC: UIViewController {
    
    
    @IBOutlet private weak var categoryCollectionView: UICollectionView!
    @IBOutlet private weak var categoryTitleLabel: UILabel!
    @IBOutlet private weak var newsCollectionView: UICollectionView!
    var news: News?
    private var selectedCategory: String = "world"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        if let flowLayout = newsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = .zero
        }
    }
    
    private func fetchData() {
        NetworkManager.shared.fetchData(valueName: selectedCategory) { (result: Result<News, Error>) in
            switch result {
                
            case .success(let news):
                self.news = news
                self.newsCollectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
// MARK: - UICollectionViewDataSource
extension HomePageVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCVCell", for: indexPath) as? NewsCVCell else {
            fatalError("Could not dequeue NewsListCollectionViewCell")
        }
        
        if let article = news?.results[indexPath.item] {
            cell.set(model: article)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension HomePageVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let clickedModel: NewsResult = news?.results[indexPath.row] else { return }
              
              let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailPageVC
              vc.set(model: clickedModel)
              vc.navigationItem.largeTitleDisplayMode = .never
              vc.modalPresentationStyle = .fullScreen
              vc.modalTransitionStyle = .flipHorizontal
              navigationController?.pushViewController(vc, animated: true)
          }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomePageVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 250)
    }
    
}


