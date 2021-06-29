//
//  ConsultTableViewCell.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit

class ConsultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var tagLbl: UILabel!
    @IBOutlet weak var contextLbl: UILabel!
    @IBOutlet weak var answerCntLbl: UILabel!
    @IBOutlet weak var regDateLbl: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setHome(data: ModelConsult) {
        self.titleLbl.text = data.title
        self.contextLbl.text = data.context
        
        var tag = ""
        let tagText = data.tagList
        
        for text in tagText {
            tag += "#\(text)  "
        }
        self.tagLbl.text = tag
        
        self.answerCntLbl.text = "답변 \(data.answerCnt)"
        self.regDateLbl.text = "\(data.regDate)"
    }

}
