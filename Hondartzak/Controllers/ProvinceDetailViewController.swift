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
        }
    }
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
