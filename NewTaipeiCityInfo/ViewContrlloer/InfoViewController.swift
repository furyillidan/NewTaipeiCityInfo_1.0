//
//  InfoViewController.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/5/19.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import UIKit
import Alamofire

class InfoViewController: UIViewController {
    
    
    var gasPriceRecordsItem = [GasPriceRecordsItem]()
    var gasPriceItem = [GasPriceList]()
    var district:String?
    
    @IBOutlet weak var infoTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.infoTableView.delegate = self
        self.infoTableView.dataSource = self
        self.infoTableView.estimatedRowHeight = 180.0;
        self.infoTableView.rowHeight = 100;
        
        load_Data(url: gasPriceAPI)
        
    }
    
    func load_Data (url:String) {
        
        let parameters: [String : Any] = [:]
        
        NTService.sharedInstance.nt_requestWithParameters(url: url, parameters) { (response) in
            
            if (response.result.value != nil && response.result.isSuccess == true) {
                let decoder = JSONDecoder()
                var result = try? decoder.decode(GasPriceModel.self, from: response.data!)
                if result?.success == true {
                    result!.result!.records!.remove(at: (result?.result?.records!.count)! - 1)
                    result!.result!.records!.remove(at: (result?.result?.records!.count)! - 1)
                    self.gasPriceItem = [result?.result] as! [GasPriceList]
                    
                }
                DispatchQueue.main.async {
                    self.infoTableView.reloadData()
                }
            }else{
                NTAlertManager.sharedInstance.callAlertView(alertTitle: "網站資料異常", alertMessage: "請稍候再試", actionTitle: "確認", view: self)
            }
        }
    }
}


extension InfoViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gasPriceItem.first?.records?.count ?? 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if gasPriceItem.count > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
            let result = gasPriceItem.first!.records
            cell.districtLabel.text = result![indexPath.row].district
            cell.price1Label.text = "16公斤平均參考售價\(result![indexPath.row].price1 ?? "0")元"
            cell.price2Label.text = "20公斤平均參考售價\(result![indexPath.row].price2 ?? "0")元"
            return cell
        }
        return UITableViewCell.init()
    }
    
}



extension InfoViewController:  UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "priceDetailViewController") as? priceDetailViewController else { return }
        UserDefaults.standard.set(self.gasPriceItem.first?.records?[indexPath.row].district ?? "", forKey: "city")
        self.present(vc, animated: true, completion: nil)
        
    }
    
}
