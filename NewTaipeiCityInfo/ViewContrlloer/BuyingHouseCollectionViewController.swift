//
//  BuyingHouseCollectionViewController.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/5/23.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import UIKit

class BuyingHouseCollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var BHCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuyingHouseCollectionViewCell", for: indexPath) as! BuyingHouseCollectionViewCell
        cell.layer.cornerRadius = 15
        return cell
    }
    


}
