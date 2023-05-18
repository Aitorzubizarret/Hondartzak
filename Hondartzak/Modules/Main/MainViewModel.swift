//
//  MainViewModel.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta on 2023-05-17.
//

import Foundation

@MainActor class MainViewModel: ObservableObject {
    @Published var beaches: [String] = ["Hondarribia", "Kontxa", "Ondarreta", "Zurriola", "Donostiako Uhartea", "Antilla", "Oribarzar", "Zarautz", "Malkorbe", "Gaztetape", "Santiago", "Itzurun", "Deba", "Ondarbeltz", "Portu", "Saturraran"]
}
