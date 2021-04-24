//
//  MainViewController.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 11/04/2021.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - UI Elements
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    weak var coordinator: MainCoordinator?
    var dataViewModel: DataViewModel = DataViewModel()
    var provinceList: [Province] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    let provinceTableViewCellIdentifier: String = "provinceTableViewCellIdentifier"
    let mapTableViewCellIdentifier: String = "mapTableViewCellIdentifier"
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Hondartzak"
        
        self.setupTableView()
        self.bind()
        
        self.dataViewModel.getLocalData()
        //self.beachesViewModel.getCloudkitData()
    }
    
    ///
    /// Setup the TableView.
    ///
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.estimatedRowHeight = 100
        
        // Register cells.
        let provinceCell: UINib = UINib(nibName: "ProvinceTableViewCell", bundle: nil)
        self.tableView.register(provinceCell, forCellReuseIdentifier: self.provinceTableViewCellIdentifier)
        
        let mapCell: UINib = UINib(nibName: "MapTableViewCell", bundle: nil)
        self.tableView.register(mapCell, forCellReuseIdentifier: self.mapTableViewCellIdentifier)
    }
    
    ///
    /// Get new data from BeachesViewModel.
    ///
    private func bind() {
        self.dataViewModel.binding = {
            if let provinceList = self.dataViewModel.provinceList {
                self.provinceList = provinceList
            }
        }
    }
}

// MARK: - UITableView Delegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            self.coordinator?.goToMaps()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section < 3 {
            let totalRows: CGFloat = 3
            let tableViewHeight = self.tableView.bounds.size.height - 130
            return tableViewHeight / totalRows
        } else {
          return 130
        }
    }
    
}

// MARK: - UITableView Data Source

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.provinceList.count + 1 // Provinces + map.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.provinceList.count > 0 {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 3 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: self.mapTableViewCellIdentifier) as! MapTableViewCell
            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: self.provinceTableViewCellIdentifier) as! ProvinceTableViewCell
            cell.coordinator = self.coordinator
            cell.province = self.provinceList[indexPath.section]
            return cell
        }
    }
    
}
