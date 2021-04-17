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

struct BeachDataMultilanguage: Codable {
    let eu: String
    let es: String
}

struct BeachLocation: Codable {
    let province: BeachDataMultilanguage
    let city: BeachDataMultilanguage
    let lat: String
    let lng: String
}

struct Beach: Codable {
    let id: Int
    let name: BeachDataMultilanguage
    let description: BeachDataMultilanguage
    let location: BeachLocation
    let webs: [BeachWebAddress]
}
