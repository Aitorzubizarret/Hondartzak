//
//  BeachesListViewModel.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta on 2023-05-18.
//

import Foundation

@MainActor class BeachesListViewModel: ObservableObject {
    
    private var beaches: [Beach] = []
    
    @Published var searchText: String = ""
    
    var filteredBeaches: [Beach] {
        if searchText.isEmpty {
            return beaches
        } else {
            return beaches.filter { $0.name.contains(searchText) || $0.cityName.contains(searchText) }
        }
    }
    
    var favoriteBeaches: [Beach] = []
    
    init() {
        let hondarribia: Beach = Beach(name: "Hondarribia", cityName: "Hondarribia")
        let Kontxa: Beach = Beach(name: "Kontxa", cityName: "Donostia")
        let ondarreta: Beach = Beach(name: "Ondarreta", cityName: "Donostia")
        let zurriola: Beach = Beach(name: "Zurriola", cityName: "Donostia")
        let donostiakoUhartea: Beach = Beach(name: "Donostiako Uhartea", cityName: "Donostia")
        let antilla: Beach = Beach(name: "Antilla", cityName: "")
        let oribarzar: Beach = Beach(name: "Oribarzar", cityName: "")
        let zarautz: Beach = Beach(name: "Zarautz", cityName: "Zarautz")
        let malkorbe: Beach = Beach(name: "Malkorbe", cityName: "Getaria")
        let gaztetape: Beach = Beach(name: "Gaztetape", cityName: "Getaria")
        let santiago: Beach = Beach(name: "Santiago", cityName: "")
        let itzurun: Beach = Beach(name: "Itzurun", cityName: "")
        let deba: Beach = Beach(name: "Deba", cityName: "Deba")
        let ondarbeltz: Beach = Beach(name: "Ondarbeltz", cityName: "Ondarbeltz")
        let portu: Beach = Beach(name: "Portu", cityName: "Portu")
        let saturraran: Beach = Beach(name: "Saturraran", cityName: "")
        
        favoriteBeaches.append(Kontxa)
        beaches = [hondarribia, Kontxa, ondarreta, zurriola, donostiakoUhartea, antilla, oribarzar, zarautz, malkorbe, gaztetape, santiago, itzurun, deba, ondarbeltz, portu, saturraran]
    }
    
}
