//
//  priceDetailTableViewCell.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/9/2gap.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import UIKit

class priceDetailTableViewCell: UITableViewCell {
    
    let detailTextView = UITextView()
    let placeNameLabel = UILabel()
    let addressBtn = UIButton()
    let companyTelephoneLabel = UILabel()
    let contactPerson = UILabel()
    let telBtn = UIButton()
    let mobilePhoneBtn = UIButton()

    let addressHeight:CGFloat = 60
    let itemHeight:CGFloat = 35
    let gap:CGFloat = 2

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = detailBackColor
        
        placeNameLabel.frame = CGRect(x: 5, y: gap, width: UIScreen.main.bounds.size.width - 20, height: itemHeight)
        placeNameLabel.textAlignment = .center
        
        addressBtn.frame = CGRect(x: 5, y: itemHeight + gap*2, width: UIScreen.main.bounds.size.width - 20, height: addressHeight)
        addressBtn.setTitleColor(UIColor.black, for: .normal)
        addressBtn.backgroundColor = detailBackColor
        addressBtn.titleLabel?.numberOfLines = 0
        addressBtn.layer.cornerRadius = 8
        
        contactPerson.frame = CGRect(x: 5, y: itemHeight + addressHeight + gap*3, width: UIScreen.main.bounds.size.width - 20, height: itemHeight)
        contactPerson.textAlignment = .center
        
        telBtn.frame = CGRect(x: 5, y: itemHeight*2 + addressHeight + gap*4, width: UIScreen.main.bounds.size.width - 20, height: itemHeight)
        telBtn.addTarget(self, action: #selector(selectTel), for: .touchUpInside)
        telBtn.setTitleColor(UIColor.black, for: .normal)
        telBtn.backgroundColor = UIColor(red: 1, green: 0.3, blue: 0, alpha: 0.2)
        telBtn.layer.cornerRadius = 8
        
        mobilePhoneBtn.frame = CGRect(x: 5, y: itemHeight*3 + addressHeight + gap*5, width: UIScreen.main.bounds.size.width - 20, height: itemHeight)
        mobilePhoneBtn.addTarget(self, action: #selector(selectMobile), for: .touchUpInside)
        mobilePhoneBtn.setTitleColor(UIColor.black, for: .normal)
        mobilePhoneBtn.backgroundColor = UIColor(red: 0.3, green: 0, blue: 1, alpha: 0.2)
        mobilePhoneBtn.layer.cornerRadius = 8
        
        self.contentView.addSubview(placeNameLabel)
        self.contentView.addSubview(contactPerson)
        self.contentView.addSubview(addressBtn)
        self.contentView.addSubview(telBtn)
        self.contentView.addSubview(mobilePhoneBtn)
    }
    
    
    @objc func selectTel () {
        let url = "tel:\(UserDefaults.standard.value(forKey: "tel") ?? "")"
        UIApplication.shared.open(URL(string: url)!)
    }
    
    @objc func selectMobile () {
        if UserDefaults.standard.value(forKey: "mobile") as! String == "不願提供" || UserDefaults.standard.value(forKey: "mobile") != nil {
            return
        }else{
            let url = "tel:\(UserDefaults.standard.value(forKey: "mobile") ?? "")"
            UIApplication.shared.open(URL(string: url)!)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
