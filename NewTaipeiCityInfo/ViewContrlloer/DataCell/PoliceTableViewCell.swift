//
//  PoliceTableViewCell.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/9/9.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import UIKit

class PoliceTableViewCell: UITableViewCell {
    
    var districtLabel = UILabel()
    var nameLabel = UILabel()
    var addressLabel = UILabel()
    var telLabel = UILabel()
    var websiteLabel = UILabel()
    var imgView = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func layout () {
        
        imgView.frame = CGRect(x: 5, y: 20, width: self.contentView.frame.width / 6.5, height: self.contentView.frame.height - 25)
        imgView.image = UIImage(named: "police_station")
        
        districtLabel.frame = CGRect(x: contentView.frame.width / 6.5 + 20, y: 3, width: self.contentView.frame.width / 2, height: self.contentView.frame.height / 5)
        districtLabel.text = "error"
        nameLabel.frame = CGRect(x: contentView.frame.width / 6.5 + 20, y: self.districtLabel.frame.height + 6, width: self.contentView.frame.width / 5, height: self.contentView.frame.height / 5)
        nameLabel.text = "teeefgrtt"
        addressLabel.frame = CGRect(x: contentView.frame.width / 6.5 + 20, y: self.nameLabel.frame.height + self.districtLabel.frame.height + 12, width: self.contentView.frame.width / 5, height: self.contentView.frame.height / 5)
        addressLabel.text = "werdfgggd"
        telLabel.frame = CGRect(x: contentView.frame.width / 6.5 + 20, y: self.addressLabel.frame.height + self.districtLabel.frame.height + self.nameLabel.frame.height + 15, width: self.contentView.frame.width / 5, height: self.contentView.frame.height / 5)
        telLabel.text = "0923112300"
        websiteLabel.frame = CGRect(x: contentView.frame.width / 6.5 + 20, y: self.telLabel.frame.height + self.districtLabel.frame.height + self.nameLabel.frame.height + self.addressLabel.frame.height + self.telLabel.frame.height + 5, width: self.contentView.frame.width / 5, height: self.contentView.frame.height / 5)
        websiteLabel.text = "oipwehfld"
    
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(districtLabel)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(addressLabel)
        self.contentView.addSubview(telLabel)
        self.contentView.addSubview(websiteLabel)
        
    }

}
