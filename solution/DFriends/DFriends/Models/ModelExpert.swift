//
//  ModelExpert.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit
import SwiftyJSON

class ModelExpert: NSObject {
    var name = String()
    var typeName = String()
    var companyName = String()
    var profileImagePath: UIImage? = nil
    
    var tagList = [String]()
    
    
    init(_ data: JSON) {
        super.init()
        print("expert: \(data)")
        
        self.name = data["name"].stringValue
        self.typeName = data["typeName"].stringValue
        self.companyName = data["companyName"].stringValue
        
        if let url = URL(string: data["profileImagePath"].stringValue), let image = try? Data(contentsOf: url) {
            self.profileImagePath = UIImage(data: image)
        }
        
        self.tagList = data["tagList"].arrayValue.map{$0["name"].stringValue}
    }
    
    override init() {
        super.init()
    }
}
