//
//  CompanyMoreVC.swift
//  DFriends
//
//  Created by zehye on 2021/07/01.
//

import UIKit

class CompanyMoreVC: UIViewController {

    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    static func instance() -> CompanyMoreVC {
        let vc = UIStoryboard.init(name: "Company", bundle: nil).instantiateViewController(withIdentifier: "CompanyMoreVC") as! CompanyMoreVC
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.topLbl.text = "병원 더보기"
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
