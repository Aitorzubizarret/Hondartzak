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
                    let beachCity: BeachCity = BeachCity(beachName: beach.name.eu,
                                                         cityName: city.name.eu)
                    self.beachesWithCity.append(beachCity)
                }
            }
            
        }
    }
    private var beachesWithCity: [BeachCity] = []
    private var beachTableViewCellIdentifier: String = "beachTableViewCellIdentifier"
    
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
        
        // Register cells.
        let beachCell: UINib = UINib(nibName: "BeachTableViewCell", bundle: nil)
        self.tableView.register(beachCell, forCellReuseIdentifier: self.beachTableViewCellIdentifier)
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
        return self.beachesWithCity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: self.beachTableViewCellIdentifier) as! BeachTableViewCell
        cell.beachName = self.beachesWithCity[indexPath.row].beachName
        cell.cityName = self.beachesWithCity[indexPath.row].cityName
        return cell
    }
    
}
