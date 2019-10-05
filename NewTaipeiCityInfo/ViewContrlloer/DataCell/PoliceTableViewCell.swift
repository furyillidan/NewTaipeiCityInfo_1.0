//
//  PoliceTableViewCell.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/9/9.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import UIKit

class PoliceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameBtn: UILabel!
    @IBOutlet weak var addressBtn: UIButton!
    @IBOutlet weak var telBtn: UIButton!
    @IBOutlet weak var websiteBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addressBtn.titleLabel?.numberOfLines = 0
        self.nameBtn.numberOfLines = 0
        self.backgroundColor = cellBackgroundColor
        self.selectionStyle = .none
        //layout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func addressAction(_ sender: Any) {
        UserDefaults.standard.set(self.addressBtn.titleLabel?.text, forKey: "address")
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "goToMap"), object: nil)
    }
    
    @IBAction func telAction(_ sender: Any) {
        UIApplication.shared.open(URL(string: "tel:\((self.telBtn.titleLabel?.text ?? "").fromSubString(from: 7))")!)
    }
    
    @IBAction func websiteAction(_ sender: Any) {
        let urlS = "https://" + "\(self.websiteBtn.titleLabel?.text ?? "")!"
        UIApplication.shared.open(URL(string: urlS)!)
    }
    

}
