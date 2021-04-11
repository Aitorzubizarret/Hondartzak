//
//  JSONReader.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 11/04/2021.
//

import Foundation

///
/// Reads a local JSON file and sends back its data.
/// - Parameter fileName: The name of the file.
/// - Parameter success: 'True' if the JSON file has been read and / or decode correctly, otherwise 'false'.
/// - Parameter data: The data of the file as T.
///
func jsonReader<T: Codable>(filename: String, completion: @escaping(_ success: Bool, _ data: T?) -> Void) {
    if let path = Bundle.main.path(forResource: filename, ofType: "json") {
        do {
            let fileUrl = URL(fileURLWithPath: path)
            
            // Get the data from the JSON file.
            let data = try Data(contentsOf: fileUrl, options: Data.ReadingOptions.alwaysMapped)
            
            // Decode the data from JSON to T object.
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            
            completion(true, decodedData)
        } catch let error {
            completion(false, nil)
            print("Error jsonReader: \(error)")
        }
    } else {
        print("Error getting the path of the JSON file.")
        completion(false, nil)
    }
}
