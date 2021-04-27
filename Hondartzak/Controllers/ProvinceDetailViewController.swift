//
//  ProvinceViewController.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 21/04/2021.
//

import UIKit

class ProvinceDetailViewController: UIViewController {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var province: Province? {
        didSet {
            guard let province = self.province else { return }
            
            self.title = province.name.eu
            
            for city in province.cities {
                for beach in city.beaches {
                    self.beachesList.append(beach)
                }
            }
            
        }
    }
    private var beachesList: [Beach] = []
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
    }
    
    ///
    /// Setup the TableView.
    ///
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

// MARK: - UITableView Delegate

extension ProvinceDetailViewController: UITableViewDelegate {}

// MARK: - UITableView Data Source

extension ProvinceDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.beachesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        cell.textLabel?.text = self.beachesList[indexPath.row].name.eu
        return cell
    }
    
}
