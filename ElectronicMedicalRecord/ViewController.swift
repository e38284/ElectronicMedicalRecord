//
//  ViewController.swift
//  ElectronicMedicalRecord
//
//  Created by 萩原祐太郎 on 2019/05/11.
//  Copyright © 2019 Yutaro_Hagiwara. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITabBarDelegate{
    
    private var myTabBar:UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 親Viewの横幅と縦幅を取得
        let width = self.view.frame.width
        let height = self.view.frame.height
        //デフォルトは49
        let tabBarHeight:CGFloat = 49
        
        /**   TabBarを設置   **/
        myTabBar = UITabBar()
        myTabBar.frame = CGRect(x:0,y:height - tabBarHeight,width:width,height:tabBarHeight)
        //バーの色
        myTabBar.barTintColor = UIColor.lightGray
        //選択されていないボタンの色
        myTabBar.unselectedItemTintColor = UIColor.white
        //ボタンを押した時の色
        myTabBar.tintColor = UIColor(red: 0.1, green: 0.7, blue: 0.9, alpha: 1.0)
        
        //ボタンを生成
        let ownerInfo:UITabBarItem = UITabBarItem(
            title: "飼い主様情報",
            image: UIImage(named:"user-7"),
            tag: 1)
        let selectRecord:UITabBarItem = UITabBarItem(
            title: "カルテ選択",
            image: UIImage(named:"file-three-7"),
            tag: 2)
        let describeRecord:UITabBarItem = UITabBarItem(
            title: "カルテ記述",
            image: UIImage(named:"fountain-pen-7"),
            tag: 3)
        let searchRecord:UITabBarItem = UITabBarItem(
            title: "カルテ検索",
            image: UIImage(named:"search-detail-7"),
            tag: 4)
        let setting:UITabBarItem = UITabBarItem(
            title: "設定",
            image: UIImage(named:"dot-more-7"),
            tag: 5)
        //ボタンをタブバーに配置する
        myTabBar.items = [ownerInfo,selectRecord,describeRecord,searchRecord,setting]
        //デリゲートを設定する
        myTabBar.delegate = self
        
        self.view.addSubview(myTabBar)
    }
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let searchRecordViewController = storyboard?.instantiateViewController(withIdentifier: "SearchRecord")
        switch item.tag{
        case 1:
            myTabBar.setViewControllers(searchRecordViewController, at: 0)
        case 2:
            print("２")
        case 3:
            print("３")
        case 4:
            print("４")
        case 5:
            print("５")
        default : return
            
        }
    }
}

