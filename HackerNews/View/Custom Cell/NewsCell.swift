//
//  NewsCell.swift
//  HackerNews
//
//  Created by GGS-BKS on 10/01/23.
//

import UIKit

class NewsCell : UITableViewCell {
    @IBOutlet weak var titleLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(title:String?){
        titleLabel.text = title ?? ""
    }
}

