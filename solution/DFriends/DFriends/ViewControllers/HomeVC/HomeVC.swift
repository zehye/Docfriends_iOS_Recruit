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
    
    var list = Array<ModelTableCell>()
    
    var expertList = Array<ModelExpert>()
    var companyList = Array<ModelCompany>()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        loadProject()
        initRefresh()
    }
    
    func initUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func loadProject() {
        WebApiManager.shared.projectList {(json) in
            json["consultList"].arrayValue.compactMap( {ModelConsult($0)} ).forEach({ self.list.append(ModelTableCell(.consult, $0)) })
            self.list.insert(ModelTableCell(.expert), at: 3)
            self.list.insert(ModelTableCell(.company), at: 7)
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return self.list.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        if section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Search") as! SearchTableViewCell
            cell.delegate = self
            return cell
        } else {
            let model = list[indexPath.row]
            switch model.type {
            case .consult:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Consult") as! ConsultTableViewCell
                if let consult = self.list[indexPath.row].consult {
                    cell.setHome(data: consult)
                }
                return cell
            case .company:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Company") as! CompanyTableViewCell
                cell.companyList = self.companyList
                cell.delegate = self
                cell.collectionView.reloadData()
                return cell
            case .expert:
                let cell = tableView.dequeueReusableCell(withIdentifier: "Expert") as! ExpertTableViewCell
                cell.expertList = self.expertList
                cell.delegate = self
                cell.collectionView.reloadData()
                return cell
                
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        
        if section == 0 {
            return 80
        } else {
            let model = list[indexPath.row]
            switch model.type {
            case .consult:
                return 200.0
            case .expert:
                return 230.0
            case .company:
                return 230.0
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = list[indexPath.row]
        switch model.type {
        case .consult:
            let vc = ConsultDetailVC.instance()
            if let consult = model.consult {
                vc.setData(model: consult)
            }
            self.navigationController?.pushViewController(vc, animated: true)
        case .expert:
            break
        case .company:
            break
        }
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
