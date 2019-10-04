//
//  NTCHospitalTableViewCell.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/10/3.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import UIKit

class NTCHospitalTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressBtn: UIButton!
    @IBOutlet weak var telBtn: UIButton!
    @IBOutlet weak var hospitalCellImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.nameLabel.numberOfLines = 0
        self.addressBtn.titleLabel?.numberOfLines = 0
        self.selectionStyle = .none
        self.backgroundColor = cellBackgroundColor
      
    }
    
    @IBAction func addressBtn(_ sender: Any) {
        UserDefaults.standard.set(self.addressBtn.titleLabel?.text, forKey: "address")
               NotificationCenter.default.post(name: NSNotification.Name(rawValue: "goToMap"), object: nil)
    }
    
    @IBAction func telBtn(_ sender: Any) {
         UIApplication.shared.open(URL(string: "tel:\((self.telBtn.titleLabel?.text ?? "").fromSubString(from: 7))")!)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

