//
//  WebApiManager.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit
import Alamofire
import SwiftyJSON

class WebApiManager: NSObject {
    static let shared = WebApiManager()
    let mainUrl = "https://docfriends.github.io/Docfriends_iOS_Recruit/api/home.json"
    
    override init() {
        super.init()
    }
    
    func projectList(success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        let url = "\(mainUrl)"
        AF.request(url, method: .get).responseJSON {(response) in
            switch response.result {
            case .success(_):
                let json = JSON(response.value!)
                success(json)
                
                break
            case.failure(_):
                let error: Error = response.error!
                failure(error)
                break
            }
        }
    }
}
