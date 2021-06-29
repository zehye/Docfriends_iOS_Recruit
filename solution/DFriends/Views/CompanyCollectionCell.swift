//
//  CompanyCollectionCell.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit

class CompanyCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setCompany(data: ModelCompany) {
        self.imgView.image = data.introPath
        self.companyLbl.text = data.companyName
        self.addressLbl.text = "\(data.address)(\(data.addressEtc))"
    }

}
