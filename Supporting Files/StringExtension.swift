//
//  StringExtension.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/9/26.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import Foundation


extension String {
    
    func toSubString (to index: Int) -> String {
        return String(self[..<self.index(self.startIndex, offsetBy: index)])
    }
    
    func fromSubString (from index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)...])
    }
}
