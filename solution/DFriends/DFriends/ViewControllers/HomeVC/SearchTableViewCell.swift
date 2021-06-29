//
//  SearchTableViewCell.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit

protocol SearchTableCellDelegate: AnyObject {
    func cellBtnClicked()
}


class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionBtn: UIButton!
    weak var delegate: SearchTableCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func questionBtnClicked(_ sender: UIButton) {
        self.delegate?.cellBtnClicked()
    }

}
