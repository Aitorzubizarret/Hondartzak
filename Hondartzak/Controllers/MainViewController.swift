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
    
    var beachesViewModel: BeachesViewModel = BeachesViewModel()
    var beachesList: [Beach] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Hondartzak"
        
        self.setupTableView()
        self.bind()
        
        self.beachesViewModel.getLocalData()
        //self.beachesViewModel.getCloudkitData()
    }
    
    ///
    /// Setup the TableView.
    ///
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    ///
    /// Get new data from BeachesViewModel.
    ///
    private func bind() {
        self.beachesViewModel.binding = {
            if let beachesList = self.beachesViewModel.beachesList {
                self.beachesList = beachesList
            }
        }
    }
}

// MARK: - UITableView Delegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beachDetailVC: BeachDetailViewController = BeachDetailViewController()
        self.navigationController?.pushViewController(beachDetailVC, animated: true)
    }
    
}

// MARK: - UITableView Data Source

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.beachesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = self.beachesList[indexPath.row].name_eu
        return cell
    }
    
}
