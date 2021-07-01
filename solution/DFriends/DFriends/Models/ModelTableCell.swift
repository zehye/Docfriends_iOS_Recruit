//
//  BaseModel.swift
//  DFriends
//
//  Created by zehye on 2021/07/01.
//

import UIKit

class ModelTableCell: NSObject {
    enum CellType {
        case consult
        case expert
        case company
    }
    var type:CellType = .consult
    var consult:ModelConsult?
    
    override init() {
        super.init()
    }
    
    convenience init(_ type:CellType, _ consult:ModelConsult? = nil) {
        self.init()
        self.type = type
        self.consult = consult
    }
    
}
