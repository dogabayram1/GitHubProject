//
//  CustomTableViewCell.swift
//  GitHubProject
//
//  Created by Doğa Bayram on 18.01.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoDescLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var view: UIView!
    var repoUrl : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        view.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(repo:Repo) {
        repoNameLabel.text = repo.name ?? ""
        repoDescLabel.text = repo.description ?? ""
        forksCountLabel.text = String(describing:repo.forks_count ?? 0)
        languageLabel.text = repo.language ?? ""
        repoUrl = repo.html_url
    }
    
}
