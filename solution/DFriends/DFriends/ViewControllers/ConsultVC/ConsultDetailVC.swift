//
//  ConsultDetailVC.swift
//  DFriends
//
//  Created by zehye on 2021/07/01.
//

import UIKit

class ConsultDetailVC: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var topLbl: UILabel!
    
    var consult = ModelConsult()
    
    static func instance() -> ConsultDetailVC {
        let vc = UIStoryboard.init(name: "Consult", bundle: nil).instantiateViewController(withIdentifier: "ConsultDetailVC") as! ConsultDetailVC
        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func setData(model:ModelConsult) {
        self.consult = model
    }
    
    func initUI() {
        self.topLbl.text = "상담명: \(self.consult.title)"
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
