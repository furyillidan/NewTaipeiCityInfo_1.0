//
//  ALLdataModel.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/10/4.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import Foundation

class GasCompany: Codable {

    var place_name: String?
    var address: String?
    var company_telephone: String?
    var contact_person: String?
    var telephone: String?
    var mobile_phone: String?
}

struct GasPriceModel : Codable {
    var success : Bool?
    var result : GasPriceList?
}


struct GasPriceList: Codable {
    var resource_id: String
    var limit: Int?
    var total: Int?
    var fields : [GasPriceFieldsItem]?
    var records : [GasPriceRecordsItem]?
}


struct GasPriceFieldsItem : Codable {
    var type : String?
    var id : String?
}


struct GasPriceRecordsItem : Codable {
    var district: String?
    var count: String?
    var price1: String?
    var price2: String?
}

struct PoliceDataModel : Codable {
    var district: String?
    var type: String?
    var name: String?
    var address: String?
    var tel: String?
    var website: String?
    var twd97E: String?
    var twd97N: String?
    var update_date: String?
}

struct NTCHospitalModel : Codable {
    var Name : String?
    var District: String?
    var Address: String?
    var Telephone: String?
    var twd97X : String?
    var twd97Y : String?
    var wgs84aX: String?
    var wgs84aY: String?
}

struct TowingStorageYardModel : Codable {
    var title : String?
    var address : String?
    var tel : String?
}

struct SightseeingSpotsModel : Codable {
    var Id: String?
    var Name: String?
    var Toldescribe: String?
    var Description: String?
    var Tel: String?
    var Add: String?
    var Opentime: String?
}



//---------------------------------------------


struct GarbageTruckModel : Codable {
    var success : Bool
    var result : GarbageTruckList
}


struct GarbageTruckList: Codable {
    var resource_id: String
    var limit: Int
    var total: Int
    var fields : [garbageTruckFieldsItem]
    var records : [garbageTruckRecordsItem]
}

struct garbageTruckFieldsItem : Codable {
    var type : String
    var id : String
}

struct garbageTruckRecordsItem : Codable {
    var city : String
    var lineid: String
    var linename: String
    var rank: String
    var name: String
    var village: String
    var longitude: String
    var latitude: String
    var time: String
    var garbage_sun: String
    var garbage_mon: String
    var garbage_tue: String
    var garbage_wed: String
    var garbage_thu: String
    var garbage_fri: String
    var garbage_sat: String
    var recycling_sun: String
    var recycling_mon: String
    var recycling_tue: String
    var recycling_wed: String
    var recycling_thu: String
    var recycling_fri: String
    var recycling_sat: String
    var foodscraps_sun: String
    var foodscraps_mon: String
    var foodscraps_tue: String
    var foodscraps_wed: String
    var foodscraps_thu: String
    var foodscraps_fri: String
    var foodscraps_sat: String
}
