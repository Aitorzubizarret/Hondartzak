//
//  BeachesListViewModel.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta on 2023-05-18.
//

import Foundation

@MainActor class BeachesListViewModel: ObservableObject {
    
    private let beaches: [String] = ["Hondarribia", "Kontxa", "Ondarreta", "Zurriola", "Donostiako Uhartea", "Antilla", "Oribarzar", "Zarautz", "Malkorbe", "Gaztetape", "Santiago", "Itzurun", "Deba", "Ondarbeltz", "Portu", "Saturraran"]
    
    @Published var searchText: String = ""
    
    var filteredBeaches: [String] {
        if searchText.isEmpty {
            return beaches
        } else {
            return beaches.filter { $0.contains(searchText) }
        }
    }
    
}
