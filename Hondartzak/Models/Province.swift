//
//  Province.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 20/04/2021.
//

import Foundation

struct Province: Codable {
    let id: Int
    let name: MultiLanguageField
    let cities: [City]
}
