//
//  ExpertMoreVC.swift
//  DFriends
//
//  Created by zehye on 2021/07/01.
//

import UIKit

class ExpertMoreVC: UIViewController {
    
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    static func instance() -> ExpertMoreVC {
        let vc = UIStoryboard.init(name: "Expert", bundle: nil).instantiateViewController(withIdentifier: "ExpertMoreVC") as! ExpertMoreVC
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.topLbl.text = "전문가 더보기"
    }
    
    @IBAction func backBtnClcked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
