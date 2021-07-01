//
//  ExpertVC.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit

class ExpertVC: UIViewController {
    
    static func instance() -> ExpertVC {
        let vc = UIStoryboard.init(name: "Expert", bundle: nil).instantiateViewController(withIdentifier: "ExpertVC") as! ExpertVC
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
