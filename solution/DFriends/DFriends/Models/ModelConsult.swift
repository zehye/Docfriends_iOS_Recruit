//
//  ModelConsult.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit
import SwiftyJSON

class ModelConsult: NSObject {
    
    var seq = Int()
    
    var title = String()
    var context = String()
    var regDate: Date?

    var answerCnt = Int()
    var tagList = [String]()
    
    
    
    init(_ data: JSON) {
        super.init()
        print("consult: \(data)")
        
        self.seq = data["seq"].intValue

        self.title = data["title"].stringValue
        self.context = data["context"].stringValue
        self.regDate = Date(timeIntervalSince1970: (data["regDate"].doubleValue/1000)) 
        
        self.answerCnt = data["answerCnt"].intValue
        
        self.tagList = data["tagList"].arrayValue.map{$0["name"].stringValue}
    }
    
    override init() {
        super.init()
    }
}
