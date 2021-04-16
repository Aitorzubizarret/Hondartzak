//
//  BeachDetailViewController.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 13/04/2021.
//

import UIKit

class BeachDetailViewController: UIViewController {
    
    // MARK: - UI Elements
    
    // MARK: - Properties
    
    var beach: Beach? {
        didSet {
            guard let beach = self.beach else { return }
            
            self.title = beach.name_eu
        }
    }
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
