//
//  DownloadService.swift
//  GitHubProject
//
//  Created by Doğa Bayram on 18.01.2022.
//

import Foundation


class DownloadService {
    
    func fetchGitHubData<T: Decodable>(searchText:String,completion: @escaping (Result<T,Error>) -> ()) {
        if let checkedUrl = URL(string: Constants.searchUrl + searchText + Constants.descendingSegment) {
            URLSession.shared.dataTask(with: checkedUrl) { data, resp, err in
                if let err = err {
                    completion(.failure(err))
                    return
                }
                do {
                    let currencies = try JSONDecoder().decode(T.self, from: data!)
                    completion(.success(currencies))
                } catch let jsonError{
                    completion(.failure(jsonError))
                }
            }.resume()
        }
    }
}
