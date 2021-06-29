//
//  HomeVC.swift
//  DFriends
//
//  Created by zehye on 2021/06/29.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var consultList = Array<ModelConsult>()
    var expertList = Array<ModelExpert>()
    var companyList = Array<ModelCompany>()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadProject()
        initUI()
    }
    
    func initUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        self.tableView.separatorStyle = .none

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
            return cell
        } else if section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Consult") as! ConsultTableViewCell
            let consult = self.consultList[indexPath.row]
            cell.setHome(data: consult)
            return cell
        } else if section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Expert") as! ExpertTableViewCell
            return cell
        } else if section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Company") as! CompanyTableViewCell
            return cell
        }
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    
    
}
