//
//  Beach.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta on 2023-05-20.
//

import Foundation

struct Beach: Codable {
    let id: UUID = UUID()
    let name: String
    let cityName: String
}
