//
//  priceDetailViewController.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/9/16.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import UIKit

class priceDetailViewController: UIViewController {
    
    @IBOutlet weak var naviTitleView: UILabel!
    @IBOutlet weak var naviView: UIView!
    @IBOutlet weak var ADView: UIView!
    var gasCompanyList = [GasCompany]()

    @IBOutlet weak var priceDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.naviTitleView.text = "配合簽定供氣契約瓦斯行清冊"
        self.naviView.backgroundColor = detailBackColor
        
        self.priceDetailTableView.delegate = self
        self.priceDetailTableView.dataSource = self
        self.priceDetailTableView.estimatedRowHeight = 140.0;
        self.priceDetailTableView.rowHeight = 220;
        
        load_Data(url: gasCompany)
        
    }
    
    @IBAction func priceDetailBackBtn(_ sender: Any) {
      self.dismiss(animated: true, completion: nil)
    }
    
    
    func load_Data (url:String) {
       
        let parameters: [String : Any] = [:]
        
        NTService.sharedInstance.nt_requestWithParameters(url: url, parameters) { (response) in
            
            if (response.result.value != nil && response.result.isSuccess == true){
                let decoder = JSONDecoder()
                let result = try? decoder.decode([GasCompany].self, from: response.data!)
                if result != nil {
                self.gasCompanyList = result!
                    var tempArray = [GasCompany]()
                    let cityName : String = UserDefaults.standard.value(forKey: "city") as? String ?? ""
                    for i in self.gasCompanyList {
                        if (i.address?.contains(cityName))! {
                            tempArray.append(i)
                        }
                    }
                    
                    self.gasCompanyList = tempArray
                    
                    DispatchQueue.main.async {
                        self.priceDetailTableView.reloadData()
                    }
                    
                }else{
                    NTAlertManager.sharedInstance.callAlertView(alertTitle: "網站資料異常", alertMessage: "請稍候再試", actionTitle: "確認", view: self)
                }
            }
        }
    }
}





extension priceDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.gasCompanyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "priceDetailTableViewCell", for: indexPath) as! priceDetailTableViewCell

        cell.placeNameLabel.text = "店名 : \(self.gasCompanyList[indexPath.row].place_name ?? "")"
        cell.addressBtn.setTitle("地址 : \(self.gasCompanyList[indexPath.row].address ?? "")", for: .normal) 
        cell.telBtn.setTitle("公司電話 : \(self.gasCompanyList[indexPath.row].company_telephone ?? "")", for: .normal)
        cell.contactPerson.text = "聯絡人 : \(self.gasCompanyList[indexPath.row].contact_person ?? "")"
        cell.mobilePhoneBtn.setTitle("手機號碼 : \(self.gasCompanyList[indexPath.row].mobile_phone ?? "")", for: .normal)
        
        UserDefaults.standard.set(self.gasCompanyList[indexPath.row].company_telephone ?? "", forKey: "tel")
        UserDefaults.standard.set(self.gasCompanyList[indexPath.row].mobile_phone ?? "", forKey: "mobile")
        return cell
    }
    
}

extension priceDetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
