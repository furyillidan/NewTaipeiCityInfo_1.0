//
//  policeViewController.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/9/9.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import UIKit

class policeViewController: UIViewController {

    @IBOutlet weak var policeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.policeTableView.delegate = self
        self.policeTableView.dataSource = self
        self.policeTableView.estimatedRowHeight = 120.0;
        self.policeTableView.rowHeight = 120;

        self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 0, alpha: 0.2)
      
    }
    

}

extension policeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PoliceTableViewCell", for: indexPath) as! PoliceTableViewCell
        return cell
    }
    
    
}
