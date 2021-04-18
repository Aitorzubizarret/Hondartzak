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
    let mapTableViewCellIdentifier: String = "mapTableViewCellIdentifier"
    
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
        
        // Register cells.
        let mapUINib: UINib = UINib(nibName: "MapTableViewCell", bundle: nil)
        self.tableView.register(mapUINib, forCellReuseIdentifier: self.mapTableViewCellIdentifier)
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
        if indexPath.section == 0 {
            let beachDetailVC: BeachDetailViewController = BeachDetailViewController()
            beachDetailVC.beach = self.beachesList[indexPath.row]
            self.navigationController?.pushViewController(beachDetailVC, animated: true)
        } else {
            let mapVC: MapViewController = MapViewController()
            self.navigationController?.pushViewController(mapVC, animated: true)
        }
    }
    
}

// MARK: - UITableView Data Source

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.beachesList.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell: UITableViewCell = UITableViewCell()
            cell.textLabel?.text = self.beachesList[indexPath.row].name.eu
            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: self.mapTableViewCellIdentifier) as! MapTableViewCell
            return cell
        }
    }
    
}
