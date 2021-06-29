//
//  ExpertCollectionCell.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit

class ExpertCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var ContainerView: UIView!
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var typeNameLbl: UILabel!
    @IBOutlet weak var tagLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
    }
    
    func initUI() {
        self.imgView.layer.cornerRadius = 12
    }
    
    func setExpert(data: ModelExpert) {
        self.nameLbl.text = data.name
        self.typeNameLbl.text = data.typeName
        self.companyLbl.text = data.companyName
        
        if data.profileImagePath == nil {
            self.imgView.image = UIImage(named: "icDefaultExpert")
        } else {
            self.imgView.image = data.profileImagePath
        }
        
        var tag = ""
        let tagText = data.tagList
        
        for text in tagText {
            tag += "#\(text)  "
        }
        self.tagLbl.text = tag
    }

}
