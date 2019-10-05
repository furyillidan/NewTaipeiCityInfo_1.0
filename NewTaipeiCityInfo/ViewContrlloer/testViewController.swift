//
//  testViewController.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/10/5.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import UIKit

class testViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func test(_ sender: Any) {
        
        UIApplication.shared.open(URL(string: "https://data.ntpc.gov.tw")!)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
