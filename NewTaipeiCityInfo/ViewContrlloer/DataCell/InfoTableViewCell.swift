//
//  InfoTableViewCell.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/5/19.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    let districtLabel = UILabel()
    let price1Label = UILabel()
    let price2Label = UILabel()
    let imgView = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layout()
        
    }
    
    
    func layout () {
        
        imgView.frame = CGRect(x: 0, y: 10, width: contentView.frame.width / 4.8, height: contentView.frame.height - 10)
        imgView.image = UIImage(named: "gas")
        districtLabel.frame = CGRect(x: contentView.frame.width / 4.8 + 10, y: 3, width: 250, height: 30)
        price1Label.frame = CGRect(x: contentView.frame.width / 4.8 + 15, y: districtLabel.frame.size.height + 2, width: 250, height: 30)
        price2Label.frame = CGRect(x: contentView.frame.width / 4.8 + 15, y: price1Label.frame.size.height + price1Label.frame.origin.y, width: 250, height: 30)
        districtLabel.font = UIFont.boldSystemFont(ofSize: 20)
        price1Label.font = price1Label.font.withSize(15)
        price2Label.font = price2Label.font.withSize(15)
        self.contentView.addSubview(districtLabel)
        self.contentView.addSubview(price1Label)
        self.contentView.addSubview(price2Label)
        self.contentView.addSubview(imgView)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
