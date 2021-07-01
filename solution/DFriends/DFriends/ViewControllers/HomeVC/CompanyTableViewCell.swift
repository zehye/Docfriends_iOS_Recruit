//
//  CompanyTableViewCell.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit

protocol CompanyTableCellDelegate: AnyObject {
    func companyCellClicked(_ company: ModelCompany)
    func moreBtnClicked()
}

class CompanyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var companyList = Array<ModelCompany>()
    weak var delegate: CompanyTableCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }

    func initUI() {
        self.collectionView.register(UINib(nibName: "CompanyCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CompanyCell")
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.reloadData()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 10)
        self.collectionView.collectionViewLayout = layout
    }
    
    @IBAction func moreBtnClicked(_ sender: UIButton) {
        self.delegate?.moreBtnClicked()
    }
}

extension CompanyTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.companyList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompanyCell", for: indexPath) as! CompanyCollectionCell
        let company = self.companyList[indexPath.row]
        cell.setCompany(data: company)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 280, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let company = self.companyList[indexPath.row]
        self.delegate?.companyCellClicked(company)
    }
    
}
