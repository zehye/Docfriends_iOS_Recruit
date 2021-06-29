//
//  ModelCompany.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit
import SwiftyJSON

class ModelCompany: NSObject {
    var companyName = String()
    var address = String()
    var addressEtc = String()
    var introPath: UIImage? = nil
    
    init(_ data: JSON) {
        super.init()
        print("company: \(data)")
        
        self.companyName = data["companyName"].stringValue
        self.address = data["address"].stringValue
        self.addressEtc = data["addressEtc"].stringValue
        
        if let url = URL(string: data["introPath"].stringValue), let image = try? Data(contentsOf: url) {
            self.introPath = UIImage(data: image)
        }
    }
}
