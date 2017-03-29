//
//  BasicCell.swift
//  Github
//
//  Created by jewelz on 2017/3/23.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit

class BasicCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        separatorInset = .zero
        layoutMargins = .zero
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        separatorInset = .zero
        layoutMargins = .zero
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        separatorInset = .zero
        layoutMargins = .zero
    }
    
    
    class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    class var nib: UINib {
         return UINib(nibName: String(describing: self), bundle: nil)
    }

}


