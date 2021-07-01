//
//  HomeVC.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBtn: UIButton!
    
    var consultList = Array<ModelConsult>()
    var expertList = Array<ModelExpert>()
    var companyList = Array<ModelCompany>()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadProject()
        initUI()
        initRefresh()
    }
    
    func initUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func loadProject() {
        WebApiManager.shared.projectList {(json) in
            let results = json["consultList"]
            self.consultList = results.arrayValue.compactMap( {ModelConsult($0)} )
            self.tableView.reloadData()
        } failure: { (error) in
            print(error)
        }
        WebApiManager.shared.projectList {(json) in
            let results = json["expertList"]
            self.expertList = results.arrayValue.compactMap( {ModelExpert($0)} )
            self.tableView.reloadData()
        } failure: { (error) in
            print(error)
        }
        WebApiManager.shared.projectList {(json) in
            let results = json["companyList"]
            self.companyList = results.arrayValue.compactMap( {ModelCompany($0)} )
            self.tableView.reloadData()
        } failure: { (error) in
            print(error)
        }
    }
    
    @IBAction func searchBtnClicked(_ sender: UIButton) {
        let vc = SearchVC.instance()
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
    }
    
    func initRefresh() {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(updateTableView(refresh:)), for: .valueChanged)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refresh
        } else {
            tableView.addSubview(refresh)
        }
    }
    
    @objc func updateTableView(refresh: UIRefreshControl) {
        refresh.endRefreshing()
        tableView.reloadData()
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return self.consultList.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        if section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Search") as! SearchTableViewCell
            cell.delegate = self 
            return cell
        } else if section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Consult") as! ConsultTableViewCell
            let consult = self.consultList[indexPath.row]
            cell.setHome(data: consult)
            return cell
        } else if section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Expert") as! ExpertTableViewCell
            cell.expertList = self.expertList
            cell.delegate = self
            cell.collectionView.reloadData()
            return cell
        } else if section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Company") as! CompanyTableViewCell
            cell.companyList = self.companyList
            cell.delegate = self
            cell.collectionView.reloadData()
            return cell
        }
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
}


extension HomeVC: SearchTableCellDelegate {
    func cellBtnClicked() {
        let vc = QuestionVC.instance()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

extension HomeVC: ExpertTableCellDelegate {
    func expertMoreBtnClicked() {
        let vc = ExpertMoreVC.instance()
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
    }
    
    func expertCellClicked(_ expert: ModelExpert) {
        let vc = ExpertDetailVC.instance()
        vc.expert = expert
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeVC: CompanyTableCellDelegate {
    func moreBtnClicked() {
        let vc = CompanyMoreVC.instance()
        vc.modalPresentationStyle = .popover
        self.present(vc, animated: true, completion: nil)
    }
    
    func companyCellClicked(_ company: ModelCompany) {
        let vc = CompanyVC.instance()
        vc.company = company
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
