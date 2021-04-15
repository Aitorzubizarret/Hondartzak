//
//  Beach.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 11/04/2021.
//

import Foundation

struct BeachLocation: Codable {
    let province_eu: String
    let province_es: String
    let city_eu: String
    let city_es: String
    let lat: String
    let lng: String
}

struct Beach: Codable {
    let id: Int
    let name_eu: String
    let name_es: String
    let location: BeachLocation
    let web_eu: String
    let web_es: String
}
