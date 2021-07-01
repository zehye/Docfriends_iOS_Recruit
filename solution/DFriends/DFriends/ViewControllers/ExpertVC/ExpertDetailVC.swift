//
//  ExpertDetailVC.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit

class ExpertDetailVC: UIViewController {
    
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    var expert = ModelExpert()
    
    static func instance() -> ExpertDetailVC {
        let vc = UIStoryboard.init(name: "Expert", bundle: nil).instantiateViewController(withIdentifier: "ExpertDetailVC") as! ExpertDetailVC
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.topLbl.text = expert.name
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
