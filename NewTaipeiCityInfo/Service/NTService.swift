//
//  NTService.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/5/26.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import Alamofire
public typealias DataResponse = Alamofire.DataResponse


class NTService: NSObject {
    
     static let sharedInstance = NTService()
    static let AFManager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 10
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    func nt_requestWithParameters(url: String, _ parameter:[String: Any],_ callback: @escaping (DataResponse<Any>) -> Void) {
        
           getRequsetWithURLString(url, parameter, callback)
    }
 
     func getRequsetWithURLString(_ url:String,_ parameter:[String: Any]?,_ callback:@escaping (DataResponse<Any>) -> Void ) {
        
        NTService.AFManager.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default, headers:nil).responseJSON { (response:DataResponse) in
            
            callback(response)
            
            switch(response.result) {
            case .success(_):
                if response.result.value != nil {
                    print(response.request?.httpMethod! as Any, response.request?.url! as Any)
                }
                
                break
            case .failure(_):
                
                break
            }
        }
        
    }
}
