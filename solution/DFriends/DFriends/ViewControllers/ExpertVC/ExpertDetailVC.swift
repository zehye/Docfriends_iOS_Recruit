//
//  ExpertDetailVC.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit

class ExpertDetailVC: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    
    static func instance() -> ExpertDetailVC {
        let vc = UIStoryboard.init(name: "Expert", bundle: nil).instantiateViewController(withIdentifier: "ExpertDetailVC") as! ExpertDetailVC
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
