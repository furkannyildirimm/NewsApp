//
//  NetworkManager.swift
//  News
//
//  Created by FurkanYıldırım on 13.05.2023.
//

import Alamofire
import Foundation

final class NetworkManager {
    static let shared = NetworkManager()

    func fetchData<T: Decodable>(valueName: String, completion: @escaping(Result<T, Error>) -> Void) {
        let url = "\(Constants.apiBaseURL.rawValue)\(valueName)\(Constants.jsonApiKey.rawValue)\(Constants.apiKey.rawValue)"
        AF.request(url).responseDecodable(of: T.self, decoder: JSONDecoder()) { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
