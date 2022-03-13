//
//  ViewController.swift
//  GitHubProject
//
//  Created by Doğa Bayram on 18.01.2022.
//

import UIKit
import SafariServices


class ViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var reposArray: [Repo] = []
    
    let downloadService = DownloadService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchTextField.roundTextField()
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.repoCell)
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        singleTap.cancelsTouchesInView = false
        view.addGestureRecognizer(singleTap)
    }
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        searchTextField.resignFirstResponder()
    }
    
    @IBAction func editingChanged(_ sender: Any) {
        if searchTextField.text == "" {
            reposArray.removeAll()
            tableView.reloadData()
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { self.fetchData(searchText: self.searchTextField.text ?? " ")}
        }
    }
    
    func fetchData(searchText : String) {
        downloadService.fetchGitHubData(searchText: searchText) { [weak self] (result : Result<Repos,Error>) in
            guard let `self` = self else { return }
            switch result {
            case .success(let repos):
                DispatchQueue.main.async {
                    self.reposArray.removeAll()
                    repos.items.forEach{self.reposArray.append($0)}
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reposArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.repoCell, for: indexPath) as! CustomTableViewCell
        
        cell.configureCell(repo: reposArray[indexPath.row])
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let detailsUrl = URL(string: reposArray[indexPath.row].html_url!) {
            let safariVC = SFSafariViewController(url: detailsUrl)
            present(safariVC, animated: true, completion: nil)
        }
    }
}

