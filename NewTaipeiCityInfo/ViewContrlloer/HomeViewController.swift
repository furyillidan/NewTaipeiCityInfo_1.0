//
//  HomeViewController.swift
//  NewTaipeiCityInfo
//
//  Created by Neo Chou on 2019/5/19.
//  Copyright © 2019 Neo Chou. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var tabBar = TYTabPagerBar()
    lazy var pagerController = TYPagerController()
    lazy var naviView = UIView()
    lazy var leftNaviBtn = UIButton()
    lazy var datas = [String]()

    var data = ["瓦斯價格","警局資訊","就醫","交通及通訊","休閒旅遊","生育保健","老年安養","生活安全及品質","求學及進修","生命禮儀"]
    //公共資訊 ,購屋及遷徙, 就醫, 交通及通訊, 休閒旅遊, 生育保健, 老年安養, 生活安全及品質, 求學及進修 生命禮儀
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.addNaviView()
        self.addTabPagerBar()
        self.addPagerController()
        self.reloadData()
        
        // Do any additional setup after loading the view.
    }

    func addNaviView() {
        self.naviView.frame = CGRect(x: 0, y: 44, width: self.view.frame.width, height: 44)
        self.naviView.backgroundColor = UIColor(red: 0.9, green: 0.8, blue: 0.7, alpha: 1)
        self.view.addSubview(self.naviView)
        self.leftNaviBtn.frame = CGRect(x: 10, y: 0, width: 44, height: 44)
        self.leftNaviBtn.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        self.leftNaviBtn.addTarget(self, action: #selector(leftNaviBtnTouch), for: .touchUpInside)
        self.naviView.addSubview(leftNaviBtn)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "oo", style: .done, target: self, action: #selector(rightNaviBtnTouch))
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
    
    @objc func rightNaviBtnTouch () {
        
    }

}

// TYTabPagerBar delegate
extension HomeViewController: TYTabPagerBarDataSource, TYTabPagerBarDelegate {
    
    func numberOfItemsInPagerTabBar() -> Int {
        return self.data.count
    }
    
    func pagerTabBar(_ pagerTabBar: TYTabPagerBar, cellForItemAt index: Int) -> UICollectionViewCell & TYTabPagerBarCellProtocol {
        let cell = pagerTabBar.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(TYTabPagerBarCell.classForCoder()), for: index)
        cell.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 0.8, alpha: 0.35)
        cell.titleLabel.textColor = UIColor.black
        cell.titleLabel.text = self.data[index]
        cell.titleLabel.font = UIFont.italicSystemFont(ofSize: 20)
        return cell
    }
    
    func pagerTabBar(_ pagerTabBar: TYTabPagerBar, widthForItemAt index: Int) -> CGFloat {
        let title = self.data[index]
        return pagerTabBar.cellWidth(forTitle: title)
    }
    
    func pagerTabBar(_ pagerTabBar: TYTabPagerBar, didSelectItemAt index: Int) {
        self.pagerController.scrollToController(at: index, animate: true);
    }

}

//TYPagerController delegate
extension HomeViewController: TYPagerControllerDataSource, TYPagerControllerDelegate {
    
    func numberOfControllersInPagerController() -> Int {
        return self.data.count
    }
    
    func pagerController(_ pagerController: TYPagerController, controllerFor index: Int, prefetching: Bool) -> UIViewController {

        switch index {
        case 0:
            let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = storyBoard.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
            return vc
        case 1:
            let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = storyBoard.instantiateViewController(withIdentifier: "policeViewController") as! policeViewController
            return vc
        default:
            let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let vc = storyBoard.instantiateViewController(withIdentifier: "InfoViewController")
            return vc
        }
    }
    
    func pagerController(_ pagerController: TYPagerController, transitionFrom fromIndex: Int, to toIndex: Int, animated: Bool) {
        self.tabBar.scrollToItem(from: fromIndex, to: toIndex, animate: animated)
    }
    func pagerController(_ pagerController: TYPagerController, transitionFrom fromIndex: Int, to toIndex: Int, progress: CGFloat) {
        self.tabBar.scrollToItem(from: fromIndex, to: toIndex, progress: progress)
    }
    
    
}
