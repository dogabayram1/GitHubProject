//
//  GitHubProjectTests.swift
//  GitHubProjectTests
//
//  Created by Doğa Bayram on 13.03.2022.
//

import XCTest
@testable import GitHubProject

class GitHubProjectTests: XCTestCase {
    
    var sut: DownloadService!

    override func setUpWithError() throws {
        sut = DownloadService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_fetch_data() throws {
        let exp = self.expectation(description: "networkExp")
        sut.fetchGitHubData(searchText: "Swift", completion: { (result : Result<Repos,Error>) in
            switch result {
            case .success(let results):
                XCTAssertEqual(results.items[0].name,"swift")
                exp.fulfill()
            case .failure(let err):
                XCTAssertThrowsError(err.localizedDescription)
                exp.fulfill()
            }
        })
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
