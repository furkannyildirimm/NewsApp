//
//  HomePageVC.swift
//  News
//
//  Created by STARK on 14.05.2023.
//

import UIKit

final class HomePageVC: UIViewController {

    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    var newsList: News?

    override func viewDidLoad() {
        super.viewDidLoad()
        //newsCollectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: "NewsCVCell")
//        newsCollectionView.register(UINib(nibName: "NewsCVCell", bundle: nil), forCellWithReuseIdentifier: "NewsCVCell")
        fetchData()
        if let flowLayout = newsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = .zero
        }
    }

    private func fetchData() {
        NetworkManager.shared.fetchData(valueName: "world") { (result: Result<News, Error>) in
            switch result {

            case .success(let news):
                self.newsList = news
                self.newsCollectionView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension HomePageVC: UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList?.results.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCVCell", for: indexPath) as? NewsCVCell else {
                fatalError("Could not dequeue NewsListCollectionViewCell")
            }

            if let article = newsList?.results[indexPath.item] {
                cell.set(model: article)
            }

            return cell
    }


}

extension HomePageVC: UICollectionViewDelegate {

}

extension HomePageVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 175, height: 250)
        }
    
    }


