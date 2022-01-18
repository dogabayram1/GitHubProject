//
//  DownloadService.swift
//  GitHubProject
//
//  Created by Doğa Bayram on 18.01.2022.
//

import Foundation


class DownloadService {
    
    static let shared = DownloadService()
    
    func fetchCurrencyData(searchText:String,completion: @escaping (Result<Repos,Error>) -> ()) {
        if let checkedUrl = URL(string: searchUrl+searchText+descendingSegment) {
            URLSession.shared.dataTask(with: checkedUrl) { data, resp, err in
                if let err = err {
                    completion(.failure(err))
                    return
                }
                do {
                    let currencies = try JSONDecoder().decode(Repos.self, from: data!)
                    completion(.success(currencies))
                } catch let jsonError{
                    completion(.failure(jsonError))
                }
            }.resume()
        }
    }
}
