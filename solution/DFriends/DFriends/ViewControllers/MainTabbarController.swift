//
//  MainTabbarController.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit

class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.showHomeTab), name: .ShowHomeTab, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.showExpertTab), name: .ShowExpertTab, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.showConsultTab), name: .ShowConsultTab, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.showProfileTab), name: .ShowProfileTab, object: nil)
        
    }
    
    @objc func showHomeTab() {
        self.selectedIndex = 1
    }
    
    @objc func showExpertTab() {
        self.selectedIndex = 2
    }
    
    @objc func showConsultTab() {
        self.selectedIndex = 3
    }
    
    @objc func showProfileTab() {
        self.selectedIndex = 4
    }

}
