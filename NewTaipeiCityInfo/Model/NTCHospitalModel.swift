//
//  NTCHospital.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/10/3.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import Foundation

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
