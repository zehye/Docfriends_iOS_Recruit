//
//  ExpertTableViewCell.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit

protocol ExpertTableCellDelegate: AnyObject {
    func expertCellClicked(_ expert: ModelExpert)
    func expertMoreBtnClicked()
}

class ExpertTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var expertList = Array<ModelExpert>()
    
    weak var delegate: ExpertTableCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    func initUI() {
        self.collectionView.register(UINib(nibName: "ExpertCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ExpertCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.reloadData()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.collectionView.collectionViewLayout = layout
    }
    
    @IBAction func expertMoreBtnClicked(_ sender: Any) {
        self.delegate?.expertMoreBtnClicked()
    }
    
}

extension ExpertTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.expertList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExpertCell", for: indexPath) as! ExpertCollectionCell
        let expert = self.expertList[indexPath.row]
        cell.setExpert(data: expert)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let expert = self.expertList[indexPath.row]
        self.delegate?.expertCellClicked(expert)
    }
    
    
}
