//
//  SearchVC.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var deleteBtn: UIButton!
    
    static func instance() -> SearchVC {
        let vc = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func deletebtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
