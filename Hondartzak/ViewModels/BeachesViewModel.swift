//
//  BeachesViewModel.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 11/04/2021.
//

import UIKit
import CloudKit

class BeachesViewModel {
    
    // MARK: - Properties
    
    // Binding.
    var binding = { () -> () in }
    
    // Data Source.
    var beachesList: [Beach]? {
        didSet {
            self.binding()
        }
    }
    
    // CloudKit Public Database.
    static let database = CKContainer.default().publicCloudDatabase
    
    // MARK: - Methods
    
    ///
    /// Get Local Data from a local JSON file.
    ///
    public func getLocalData() {
        jsonReader(filename: "Beaches") { (success, data: [Beach]?) in
            DispatchQueue.main.async {
                if success, let receivedData = data {
                    self.beachesList = receivedData
                }
            }
        }
    }
    
    ///
    /// Get CloudKit Data.
    ///
    public func getCloudkitData() {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Beach", predicate: predicate)
        
        let operation = CKQueryOperation(query: query)
        operation.desiredKeys = ["name", "web"]
        operation.resultsLimit = 50
        
        var cloudKitBeaches = [Beach]()
        
        operation.recordFetchedBlock = { record in
            let beachName: String = record["name"] as! String
            let beachLocation = BeachLocation(province_eu: "Gipuzkoa", province_es: "Gipuzkoa", city_eu: "Eibar", city_es: "Eibar", lat: "", lng: "")
            let beach = Beach(id: 2, name_eu: beachName, name_es: beachName, location: beachLocation, web_eu: "", web_es: "")
            
            cloudKitBeaches.append(beach)
        }

        operation.queryCompletionBlock = { (cursor, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error: \(error)")
                } else {
                    self.beachesList = cloudKitBeaches
                }
            }
        }
        
        BeachesViewModel.database.add(operation)
    }
    
}
