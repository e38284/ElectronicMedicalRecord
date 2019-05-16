//
//  ViewController.swift
//  ElectronicMedicalRecord
//
//  Created by 萩原祐太郎 on 2019/05/11.
//  Copyright © 2019 Yutaro_Hagiwara. All rights reserved.
//

import UIKit
import ESTabBarController

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTab()
    }
    
    func setupTab() {
        
        // 画像のファイル名を指定してESTabBarControllerを作成する
        let tabBarController: ESTabBarController! = ESTabBarController(tabIconNames: ["user-7", "file-three-7", "fountain-pen-7", "search-detail-7", "dot-more-7"])
        
        // 選択時のアイコンの色と真ん中のボタンを設定する(オレンジ)
        tabBarController.selectedColor = UIColor(red: 1.0, green: 0.44, blue: 0.11, alpha: 1)
        // 背景色(薄いオレンジ)
        tabBarController.buttonsBackgroundColor = UIColor(red: 0.96, green: 0.91, blue: 0.87, alpha: 1)
        // 選択時の下線の太さ
        tabBarController.selectionIndicatorHeight = 5
        
        // 作成したESTabBarControllerを親のViewController（＝self）に追加する
        addChild(tabBarController)
        let tabBarView = tabBarController.view!
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabBarView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tabBarView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tabBarView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            ])
        tabBarController.didMove(toParent: self)
        
        // タブをタップした時に表示するViewControllerを設定する
        let ownerInfoViewController = storyboard?.instantiateViewController(withIdentifier: "OwnerInfo")
        let selectRecordViewController = storyboard?.instantiateViewController(withIdentifier: "SelectRecord")
        let searchRecordViewController = storyboard?.instantiateViewController(withIdentifier: "SearchRecord")
        let settingViewController = storyboard?.instantiateViewController(withIdentifier: "Setting")
        
        tabBarController.setView(ownerInfoViewController, at: 0)
        tabBarController.setView(selectRecordViewController, at: 1)
        tabBarController.setView(searchRecordViewController, at: 3)
        tabBarController.setView(settingViewController, at: 4)
        
        // 真ん中のタブはボタンとして扱う
        tabBarController.highlightButton(at: 2)
        tabBarController.setAction({
            // ボタンが押されたらImageViewControllerをモーダルで表示する
            let describeRecordViewController = self.storyboard?.instantiateViewController(withIdentifier: "DescribeRecord")
            self.present(describeRecordViewController!, animated: true, completion: nil)
        }, at: 2)
    }
}

