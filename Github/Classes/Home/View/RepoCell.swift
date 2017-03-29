//
//  RepoCell Cell.swift
//  Github
//
//  Created by jewelz on 2017/3/23.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit

class RepoCell: BasicCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var languageColorView: UIView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    
    @IBOutlet weak var separatorHeightConstraint: NSLayoutConstraint!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with repos: Repos) {
        titleLabel.text = repos.name
        descriptionLabel.text = repos.desc
        languageColorView.backgroundColor = repos.color
        languageLabel.text = repos.language
        starsLabel.text = repos.starts
        forksLabel.text = repos.forks
    }
    
}
