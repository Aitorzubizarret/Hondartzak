//
//  City.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 20/04/2021.
//

import Foundation

struct City: Codable {
    let id: Int
    let name: MultiLanguageField
    let beaches: [Beach]
}
