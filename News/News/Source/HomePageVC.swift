//
//  HomePageVC.swift
//  News
//
//  Created by FurkanYıldırım on 14.05.2023.
//

import UIKit

final class HomePageVC: UIViewController {
    
    
    @IBOutlet private weak var categoryCollectionView: UICollectionView!
    @IBOutlet private weak var categoryTitleLabel: UILabel!
    @IBOutlet private weak var newsCollectionView: UICollectionView!
    var news: News?
    private var selectedCategory: String = "arts"
    var categories: [String] = ["arts", "automobiles", "books", "business", "fashion", "food", "health", "home", "insider", "magazine", "movies", "obituaries", "opinion", "politics", "realestate", "science", "sports", "technology", "travel", "us", "world"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        fetchData()
    }
    
    private func configureCollectionView(){
        categoryCollectionView.showsHorizontalScrollIndicator = false
        if let flowLayout = newsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = .zero
        }
    }
        
    
    private func fetchData() {
        NetworkManager.shared.fetchData(valueName: selectedCategory) { (result: Result<News, Error>) in
            switch result {
                
            case .success(let news):
                self.news = news.filterResults()
                self.newsCollectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
// MARK: - UICollectionViewDataSource
extension HomePageVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollectionView {
            return categories.count
        } else if collectionView == newsCollectionView {
            return news?.results.count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCVCell", for: indexPath) as! CategoryCVCell
            let category = categories[indexPath.item]
            cell.configure(category: category, isSelected: selectedCategory.lowercased() == category.lowercased())
            
            return cell
        } else if collectionView == newsCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCVCell", for: indexPath) as! NewsCVCell
            if let article = news?.results[indexPath.item] {
                cell.set(model: article)
            }
            return cell
        }
        fatalError("Unexpected collection view")
    }
}

// MARK: - UICollectionViewDelegate
extension HomePageVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            selectedCategory = categories[indexPath.item]
            collectionView.reloadData()
            fetchData()
        } else if collectionView == newsCollectionView {
            guard let clickedModel: NewsResult = news?.results[indexPath.row] else { return }
            let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailPageVC
            vc.set(model: clickedModel)
            vc.navigationItem.largeTitleDisplayMode = .never
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomePageVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollectionView {
            return CGSize(width: 100, height: 50)
        } else if collectionView == newsCollectionView {
            return CGSize(width: 175, height: 250)
        }
        return CGSize.zero
    }
}


