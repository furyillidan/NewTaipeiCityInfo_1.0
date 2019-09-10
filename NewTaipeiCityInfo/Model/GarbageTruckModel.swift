//
//  GarbageTruckModel.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/5/20.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import Foundation

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




//
//district: "板橋區",
//count: "37",
//price1: "780",
//price2: "885"



//city: "萬里區",
//lineid: "207001",
//linename: "A路線下午",
//rank: "1",
//name: "獅頭路15-1號(海巡)",
//village: "萬里里",
//longitude: "121.6945286",
//latitude: "25.17950406",
//time: "12:40",
//memo: "",
//garbage_sun: "",
//garbage_mon: "Y",
//garbage_tue: "Y",
//garbage_wed: "",
//garbage_thu: "Y",
//garbage_fri: "Y",
//garbage_sat: "Y",
//recycling_sun: "",
//recycling_mon: "Y",
//recycling_tue: "Y",
//recycling_wed: "",
//recycling_thu: "Y",
//recycling_fri: "Y",
//recycling_sat: "Y",
//foodscraps_sun: "",
//foodscraps_mon: "Y",
//foodscraps_tue: "Y",
//foodscraps_wed: "",
//foodscraps_thu: "Y",
//foodscraps_fri: "Y",
//foodscraps_sat: "Y"
