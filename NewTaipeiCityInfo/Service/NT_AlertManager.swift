//
//  NT_AlertManager.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/5/27.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import Foundation
import UIKit

class NTAlertManager: NSObject {
    
    var alertController:UIAlertController?
    
    static let sharedInstance = NTAlertManager()
    
    
    func callAlertView (alertTitle: String?, alertMessage: String?, actionTitle: String?, view: UIViewController?) {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: nil)
        alert.addAction(action)
        view?.present(alert, animated: true, completion: nil)
    }
    
}
