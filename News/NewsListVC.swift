//
//  NewsListVC.swift
//  News
//
//  Created by STARK on 13.05.2023.
//

import UIKit

final class NewsListVC: UIViewController {
    
    @IBOutlet weak var newsSearchBar: UISearchBar!
    @IBOutlet private weak var newsTableView: UITableView!
    var newsList: News?
    var searchMake = false
    var searchResult: News?
    @IBOutlet private weak var emptyView: EmptyView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.register(UINib(nibName: "NewsListTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        fetchData()
        newsTableView.separatorStyle = .none
    }

    private func fetchData() {
        NetworkManager.shared.fetchData(valueName: "books") { (result: Result<News, Error>) in
            switch result {
            case .success(let news):
                self.newsList = news
                self.newsTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func showEmptyView(){
        if let list = searchResult?.results{
            emptyView.isHidden = !list.isEmpty
            newsTableView.isHidden = list.isEmpty
        }else{
            emptyView.isHidden = true
            newsTableView.isHidden = false
        }
    }
}

// MARK: - UITableViewDataSource
extension NewsListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchMake, let searchResult = searchResult {
            return searchResult.results.count
        } else if let newsList = newsList {
            return newsList.results.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsListTableViewCell else { return .init() }
        let model = searchMake ? searchResult!.results[indexPath.row] : newsList!.results[indexPath.row]
        cell.set(model: model)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension NewsListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let clickedModel: NewsResult = searchMake ? searchResult?.results[indexPath.row] : newsList?.results[indexPath.row] else { return }

        let vc = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailPageVC
        vc.set(model: clickedModel)
                vc.navigationItem.largeTitleDisplayMode = .never
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .flipHorizontal
                navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}

// MARK: - SearcBarDelegate
extension NewsListVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            searchMake = false
            searchResult = nil
        } else {
            searchMake = true
            if let newsList = newsList {
                searchResult = News(results: newsList.results.filter { $0.title.lowercased().contains(searchText.lowercased()) })
               
            }
            showEmptyView()
           
        }
        newsTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        searchMake = false
        searchResult = nil
        showEmptyView()
        newsTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
