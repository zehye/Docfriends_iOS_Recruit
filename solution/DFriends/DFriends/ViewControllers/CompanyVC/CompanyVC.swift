//
//  CompanyVC.swift
//  DFriends
//
//  Created by zehye on 2021/07/01.
//

import UIKit

class CompanyVC: UIViewController {
    
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    var company = ModelCompany()
    
    static func instance() -> CompanyVC {
        let vc = UIStoryboard.init(name: "Company", bundle: nil).instantiateViewController(withIdentifier: "CompanyVC") as! CompanyVC
        return vc
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.topLbl.text = "병원명: \(company.companyName)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
