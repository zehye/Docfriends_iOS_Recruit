//
//  QuestionVC.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit

class QuestionVC: UIViewController {
    
    @IBOutlet weak var deleteBtn: UIButton!

    static func instance() -> QuestionVC {
        let vc = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "QuestionVC") as! QuestionVC
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func deleteBtnClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
