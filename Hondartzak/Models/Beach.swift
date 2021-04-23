//
//  Beach.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 11/04/2021.
//

import Foundation

struct BeachWebAddress: Codable {
    let url: String
    let description: String
    let language: String
}

struct Beach: Codable {
    let id: Int
    let name: MultiLanguageField
    let description: MultiLanguageField
    let location: LatLng
    let webs: [BeachWebAddress?]
}
