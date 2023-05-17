//
//  NewsListVC.swift
//  News
//
//  Created by FurkanYıldırım on 13.05.2023.
//

import UIKit

final class NewsListVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var newsSearchBar: UISearchBar!
    @IBOutlet private weak var newsTableView: UITableView!
    
    // MARK: - Properties
    var newsList: News?
    var searchMake = false
    var searchResult: News?
    private var notFoundImageView: UIImageView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNewsTableViewCell()
        fetchData()
        configureNotFoundView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        centerNotFoundImageView()
    }
    
    // MARK: - Private Methods
    private func centerNotFoundImageView(){
        notFoundImageView.center = view.center
    }
    
    private func registerNewsTableViewCell(){
        newsTableView.register(UINib(nibName: "NewsListTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
    }
    
    private func configureNotFoundView(){
        newsTableView.separatorStyle = .none
        notFoundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        notFoundImageView.image = UIImage(named: "notFound")
        notFoundImageView.contentMode = .scaleAspectFit
        notFoundImageView.center = view.center
        notFoundImageView.isHidden = true
        notFoundImageView.layer.cornerRadius = 50
        notFoundImageView.clipsToBounds = true
        view.addSubview(notFoundImageView)
    }
    
    private func fetchData() {
        NetworkManager.shared.fetchData(valueName: "world") { (result: Result<News, Error>) in
            switch result {
            case .success(let news):
                self.newsList = news.filterResults()
                self.newsTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension NewsListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchMake {
            return searchResult?.results.count ?? 0
        } else {
            return newsList?.results.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsListTableViewCell else {
            return UITableViewCell()
        }
        
        if searchMake, let result = searchResult {
            cell.set(model: result.results[indexPath.row])
        } else if let news = newsList {
            cell.set(model: news.results[indexPath.row])
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension NewsListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchMake, let result = searchResult {
            let clickedModel = result.results[indexPath.row]
            let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailPageVC
            vc.set(model: clickedModel)
            vc.navigationItem.largeTitleDisplayMode = .never
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            navigationController?.pushViewController(vc, animated: true)
        } else if let news = newsList {
            let clickedModel = news.results[indexPath.row]
            let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailPageVC
            vc.set(model: clickedModel)
            vc.navigationItem.largeTitleDisplayMode = .never
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}

// MARK: - SearcBarDelegate
extension NewsListVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterNewsList(for: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        filterNewsList(for: "")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    private func filterNewsList(for searchText: String) {
        if searchText.isEmpty {
            searchMake = false
            searchResult = nil
            notFoundImageView.isHidden = true
        } else {
            searchMake = true
            searchResult = newsList?.filterResults(with: searchText)
            
            if searchResult?.results.isEmpty ?? true {
                notFoundImageView.isHidden = false
            } else {
                notFoundImageView.isHidden = true
            }
        }
        newsTableView.reloadData()
    }
}

// MARK: - News+Filtering
extension News {
    func filterResults(with searchText: String) -> News {
        let filteredResults = results.filter { $0.title.range(of: searchText, options: .caseInsensitive) != nil }
        return News(results: filteredResults)}
    
    func filterResults() -> News {
        let filteredResults = results.filter { !$0.title.isEmpty }
        return News(results: filteredResults)}
}


