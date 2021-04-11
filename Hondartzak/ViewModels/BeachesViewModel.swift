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
        let beach1: Beach = Beach(name: "Zurriola")
        var list: [Beach] = []
        list.append(beach1)
        self.beachesList = list
    }
}
