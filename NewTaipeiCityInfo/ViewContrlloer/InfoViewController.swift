//
//  InfoViewController.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/5/19.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import UIKit
import Alamofire
import GoogleMobileAds

//enum dataTypeNumber : Int {
//    case GasPrice = 0
//    case Police = 1
//    case Hospital = 2
//    case Traffic = 3
//    case Travel = 4
//    case Health = 5
//    case ElderlyCare = 6
//    case LifeSafe = 7
//    case study = 8
//    case LifeEtiquette = 9
//}

class InfoViewController: UIViewController {
    
    @IBOutlet weak var GADbanner: GADBannerView!
    
    var gasPriceRecordsItem = [GasPriceRecordsItem]()
    var gasPriceItem = [GasPriceList]()
    var policeItem = [PoliceDataModel]()
    var NTCHospitalItem = [NTCHospitalModel]()
    var towingStorageYardItem = [TowingStorageYardModel]()
    var SightseeingSpotsItem = [SightseeingSpotsModel]()
    var district:String?
    var witchOne : Int?
    //var refreshController : UIRefreshControl!
    
    @IBOutlet weak var infoTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GADbanner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        GADbanner.rootViewController = self
        GADbanner.load(GADRequest())
        
        NotificationCenter.default.addObserver(self, selector: #selector(goToGoogleMap), name: NSNotification.Name(rawValue: "goToMap"), object: nil)
        
//        refreshController = UIRefreshControl()
//        infoTableView.addSubview(refreshController)
        
        self.infoTableView.delegate = self
        self.infoTableView.dataSource = self
        self.infoTableView.estimatedRowHeight = 180.0
        switch witchOne {
        case 0:
            self.infoTableView.rowHeight = 100
        case 1:
            self.infoTableView.rowHeight = 160
        case 2:
            self.infoTableView.rowHeight = 140
        case 3:
            self.infoTableView.rowHeight = 160
        case 4:
            self.infoTableView.rowHeight = 140
        default:
            break
        }
        
        load_Data()
        
    }
    
    
    @objc func goToGoogleMap () {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
              let vc = storyBoard.instantiateViewController(withIdentifier: "PriceMapViewController") as! PriceMapViewController
        vc.addresData = UserDefaults.standard.value(forKey: "address") as? String ?? ""
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    func load_Data () {
        
        var url = ""
      
        switch witchOne {
        case 0:
            url = gasPriceAPI
        case 1:
            url = policeDataAPI
        case 2:
            url = NTCHospitalAPI
        case 3:
            url = TowingStorageYardAPI
        case 4:
            url = SightseeingSpotsAPI
        default:
            break
        }
        
        let parameters: [String : Any] = [:]
        
        NTService.sharedInstance.nt_requestWithParameters(url: url , parameters) { (response) in

            
            if (response.result.value != nil && response.result.isSuccess == true) {
                
                let decoder = JSONDecoder()
                
                switch self.witchOne {
                case 0:
                    var result = try? decoder.decode(GasPriceModel.self, from: response.data!)
                    if result?.success == true {
                        result!.result!.records!.remove(at: (result?.result?.records!.count)! - 1)
                        result!.result!.records!.remove(at: (result?.result?.records!.count)! - 1)
                        self.gasPriceItem = [result?.result] as! [GasPriceList]
                       }
                case 1:
                    let result = try? decoder.decode([PoliceDataModel].self, from: response.data!)
                    if result != nil {
                        self.policeItem = result!
                        
                    }
                case 2:
                    let result = try? decoder.decode([NTCHospitalModel].self, from: response.data!)
                    if result != nil {
                        self.NTCHospitalItem = result!
                        
                    }
                case 3:
                    let result = try? decoder.decode([TowingStorageYardModel].self, from: response.data!)
                    if result != nil {
                        self.towingStorageYardItem = result!
                       
                    }
                    
                case 4:
                    let result = try? decoder.decode([SightseeingSpotsModel].self, from: response.data!)
                    if result != nil {
                        self.SightseeingSpotsItem = result!
                        
                    }
                default:
                    break
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
        switch witchOne {
        case 0:
            return gasPriceItem.first?.records?.count ?? 1
        case 1:
            return policeItem.count
        case 2:
            return NTCHospitalItem.count
        case 3:
            return towingStorageYardItem.count
        case 4:
            return SightseeingSpotsItem.count
        default:
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch witchOne {
        case 0:
            if gasPriceItem.count > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
            let result = gasPriceItem.first!.records
            cell.districtLabel.text = result![indexPath.row].district
            cell.price1Label.text = "16公斤平均參考售價\(result![indexPath.row].price1 ?? "0")元"
            cell.price2Label.text = "20公斤平均參考售價\(result![indexPath.row].price2 ?? "0")元"
            return cell
          }
        case 1:
            if policeItem.count > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PoliceTableViewCell", for: indexPath) as! PoliceTableViewCell
            cell.nameBtn.text = policeItem[indexPath.row].name
            cell.addressBtn.setTitle("地址 : \(policeItem[indexPath.row].address ?? "")", for: .normal)
            cell.telBtn.setTitle("警局電話 : \(policeItem[indexPath.row].tel ?? "")", for: .normal)
            if policeItem[indexPath.row].website == "" {
                cell.websiteBtn.setTitle("暫不提供" , for: .normal)
            }else{
                cell.websiteBtn.setTitle(policeItem[indexPath.row].website , for: .normal)
            }
            return cell
          }
        case 2:
            if NTCHospitalItem.count > 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "NTCHospitalTableViewCell", for: indexPath) as! NTCHospitalTableViewCell
                cell.nameLabel.text = NTCHospitalItem[indexPath.row].Name
                cell.addressBtn.setTitle(NTCHospitalItem[indexPath.row].Address, for: .normal)
                cell.telBtn.setTitle("警局電話 : \(NTCHospitalItem[indexPath.row].Telephone ?? "")", for: .normal)
                cell.hospitalCellImageView.image = UIImage(named: "hospital")
                return cell
            }
        case 3:
            if towingStorageYardItem.count > 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "NTCHospitalTableViewCell", for: indexPath) as! NTCHospitalTableViewCell
                cell.nameLabel.text = towingStorageYardItem[indexPath.row].title
                cell.addressBtn.setTitle(towingStorageYardItem[indexPath.row].address, for: .normal)
                cell.telBtn.setTitle("公司電話 : \(telHandle(tel: self.towingStorageYardItem[indexPath.row].tel) ?? "")", for: .normal)
                cell.hospitalCellImageView.image = UIImage(named: "crane")
                return cell
            }
        case 4:
            if SightseeingSpotsItem.count > 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "SightseeingSpotsTableViewCell", for: indexPath) as! SightseeingSpotsTableViewCell
                
                return cell
            }
        default :
            break
        }
        return UITableViewCell.init()
  }
    
    func telHandle (tel: String?) -> String? {
        
        var tempString = ""
        if tel!.count > 13 {
            tempString = (tel?.toSubString(to: 13))!
        }else{
            tempString = tel!
        }
        return tempString
    }
    
}



extension InfoViewController:  UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.gasPriceItem.count > 0 {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "priceDetailViewController") as? priceDetailViewController else { return }
        UserDefaults.standard.set(self.gasPriceItem.first?.records?[indexPath.row].district ?? "", forKey: "city")
        self.present(vc, animated: true, completion: nil)
        } else {
            return
        }
        
    }
}
