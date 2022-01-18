//
//  Repo.swift
//  GitHubProject
//
//  Created by Doğa Bayram on 18.01.2022.
//

import Foundation


struct Repos : Codable {
    var items: [Repo]
}

struct Repo : Codable {
    var name: String?
    var description: String?
    var forks_count: Int?
    var language: String?
    var html_url: String?
}
