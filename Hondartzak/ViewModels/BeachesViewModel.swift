//
//  BeachesViewModel.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 11/04/2021.
//

import UIKit

class BeachesViewModel {
    
    // MARK: - Properties
    
    // Binding.
    var binding = { () -> () in }
    
    // Data Source.
    var beachesList: [Beach]? {
        didSet {
            self.binding()
        }
    }
    
    // MARK: - Methods
    
    public func getLocalData() {
        jsonReader(filename: "Beaches") { (success, data: [Beach]?) in
            DispatchQueue.main.async {
                if success, let receivedData = data {
                    self.beachesList = receivedData
                }
            }
        }
    }
}
