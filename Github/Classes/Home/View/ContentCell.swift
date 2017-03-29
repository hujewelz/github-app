//
//  ContentCell.swift
//  Github
//
//  Created by jewelz on 2017/3/29.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit
import SnapKit

class ContentCell: BasicCell {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = BLACK_TEXT_COLOR
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    var fileImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(fileImageView)
        contentView.addSubview(titleLabel)
        
        fileImageView.snp.makeConstraints { maker in
            maker.centerY.equalTo(fileImageView.superview!)
            maker.left.equalTo(15)
        }
        
        titleLabel.snp.makeConstraints { maker in
            maker.centerY.equalTo(titleLabel.superview!)
            maker.left.equalTo(40)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
