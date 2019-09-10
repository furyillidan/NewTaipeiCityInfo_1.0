//
//  GasPriceModel.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/5/20.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import Foundation


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
