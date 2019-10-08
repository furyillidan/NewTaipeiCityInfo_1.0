//
//  HomeViewController.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/5/19.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

enum DataItem {
    case gasPrice
    case police
    case hospital
    case towingStorageYard
    case sightseeingSpots
    
    var title : String {
        switch self {
        case .gasPrice:
            return "瓦斯價格"
        case .police:
            return "警局資訊"
        case .hospital:
            return "醫院資訊"
        case .towingStorageYard:
            return "拖吊保管場資訊"
        case .sightseeingSpots:
            return "觀光旅遊景點"
        }
    }
}


import UIKit

class HomeViewController: UIViewController {
    
    lazy var tabBar = TYTabPagerBar()
    lazy var pagerController = TYPagerController()
    lazy var naviView = UIView()
    lazy var leftNaviBtn = UIButton()
    lazy var rightNaviBtn = UIButton()
    lazy var datas = [String]()
    lazy var titleLabel = UILabel()

    var dataArray = [DataItem]()
                //"生育保健","老年安養","生活安全及品質","求學及進修","生命禮儀"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.white
        self.setupItems()
        self.addNaviView()
        self.addTabPagerBar()
        self.addPagerController()
        self.reloadData()
        
        // Do any additional setup after loading the view.
    }

    func setupItems () {
        self.dataArray.append(.gasPrice)
        self.dataArray.append(.police)
        self.dataArray.append(.hospital)
        self.dataArray.append(.towingStorageYard)
        self.dataArray.append(.sightseeingSpots)
    }
    
    
    func addNaviView() {
        self.naviView.frame = CGRect(x: 0, y: 44, width: self.view.frame.width, height: 44)
        self.naviView.backgroundColor = UIColor(red: 0.9, green: 0.8, blue: 0.7, alpha: 1)
        self.view.addSubview(self.naviView)
        self.leftNaviBtn.frame = CGRect(x: 10, y: 0, width: 44, height: 44)
        self.leftNaviBtn.addTarget(self, action: #selector(leftNaviBtnTouch), for: .touchUpInside)
        self.rightNaviBtn.frame = CGRect(x: screenSize.width - 54, y: 0, width: 44, height: 44)
        self.rightNaviBtn.setImage(UIImage(named: "info"), for: .normal)
        self.rightNaviBtn.addTarget(self, action: #selector(rightNaviBtnTouch), for: .touchUpInside)
        self.titleLabel.frame = CGRect(x: self.view.frame.width / 2 - 100, y: 0, width: 200, height: self.naviView.frame.size.height)
        self.titleLabel.text = "新北市資訊"
        self.titleLabel.font = .systemFont(ofSize: 20)
        self.titleLabel.textAlignment = .center
        self.naviView.addSubview(titleLabel)
        self.naviView.addSubview(leftNaviBtn)
        self.naviView.addSubview(rightNaviBtn)
      
    }

    func addTabPagerBar() {
        self.tabBar.delegate = self
        self.tabBar.dataSource = self
        self.tabBar.register(TYTabPagerBarCell.classForCoder(), forCellWithReuseIdentifier: NSStringFromClass(TYTabPagerBarCell.classForCoder()))
        self.view.addSubview(self.tabBar)
    }
    
    func addPagerController() {
        self.pagerController.dataSource = self
        self.pagerController.delegate = self
        self.addChild(self.pagerController)
        self.view.addSubview(self.pagerController.view)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.tabBar.frame = CGRect(x: 0, y: 85, width: self.view.frame.width, height: 50)
        self.pagerController.view.frame = CGRect(x: 0, y: self.tabBar.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - self.tabBar.frame.maxY)
    }
    
    
    func reloadData() {
        self.tabBar.reloadData()
        self.pagerController.reloadData()
    }
    
    @objc func leftNaviBtnTouch () {
        
    }
    
    @objc func rightNaviBtnTouch() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if #available(iOS 13.0, *) {
            let vc = storyboard.instantiateViewController(identifier: "popoverViewController")
            vc.modalPresentationStyle = .popover
            vc.popoverPresentationController?.delegate = self
            vc.popoverPresentationController?.sourceView = rightNaviBtn
            vc.popoverPresentationController?.sourceRect = CGRect(x: self.rightNaviBtn.bounds.midX, y: self.rightNaviBtn.bounds.midY , width: 0, height: 0)
            vc.preferredContentSize = CGSize(width: 300, height: 70)
            self.present(vc, animated: true, completion: nil)
        } else {
            // Fallback on earlier versions
        }
        
    }
}

// TYTabPagerBar delegate
extension HomeViewController: TYTabPagerBarDataSource, TYTabPagerBarDelegate {
    
    func numberOfItemsInPagerTabBar() -> Int {
        return self.dataArray.count
    }
    
    func pagerTabBar(_ pagerTabBar: TYTabPagerBar, cellForItemAt index: Int) -> UICollectionViewCell & TYTabPagerBarCellProtocol {
        let cell = pagerTabBar.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(TYTabPagerBarCell.classForCoder()), for: index)
        cell.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 0.8, alpha: 0.35)
        cell.titleLabel.textColor = UIColor.black
        cell.titleLabel.text = self.dataArray[index].title
        cell.titleLabel.font = UIFont.italicSystemFont(ofSize: 20)
        return cell
    }
    
    func pagerTabBar(_ pagerTabBar: TYTabPagerBar, widthForItemAt index: Int) -> CGFloat {
        let title = self.dataArray[index].title
        return pagerTabBar.cellWidth(forTitle: title)
    }
    
    func pagerTabBar(_ pagerTabBar: TYTabPagerBar, didSelectItemAt index: Int) {
        self.pagerController.scrollToController(at: index, animate: true);
    }

}

//TYPagerController delegate
extension HomeViewController: TYPagerControllerDataSource, TYPagerControllerDelegate {
    
    func numberOfControllersInPagerController() -> Int {
        return self.dataArray.count
    }
    
    func pagerController(_ pagerController: TYPagerController, controllerFor index: Int, prefetching: Bool) -> UIViewController {

            let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = storyBoard.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
            vc.witchOne = index
            return vc
    }
    
    func pagerController(_ pagerController: TYPagerController, transitionFrom fromIndex: Int, to toIndex: Int, animated: Bool) {
        self.tabBar.scrollToItem(from: fromIndex, to: toIndex, animate: animated)
    }
    func pagerController(_ pagerController: TYPagerController, transitionFrom fromIndex: Int, to toIndex: Int, progress: CGFloat) {
        self.tabBar.scrollToItem(from: fromIndex, to: toIndex, progress: progress)
    }
    
    
}

extension HomeViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
