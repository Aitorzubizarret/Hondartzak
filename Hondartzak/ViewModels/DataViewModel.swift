//
//  BeachesViewModel.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 11/04/2021.
//

import UIKit
import CloudKit

class DataViewModel {
    
    // MARK: - Properties
    
    // Binding.
    var binding = { () -> () in }
    
    // Data Source.
    var provinceList: [Province]? {
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
        jsonReader(filename: "Beaches") { (success, data: [Province]?) in
            DispatchQueue.main.async {
                if success, let receivedData = data {
                    self.provinceList = receivedData
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
        
        var cloudKitBeaches = [Province]()
        
//        operation.recordFetchedBlock = { record in
//            let beachCloudKitName: String = record["name"] as! String
//            let beachName: BeachDataMultilanguage = BeachDataMultilanguage(eu: beachCloudKitName, es: "")
//            let beachDescription: BeachDataMultilanguage = BeachDataMultilanguage(eu: "", es: "")
//            let beachProvince: BeachDataMultilanguage = BeachDataMultilanguage(eu: "Gipuzkoa", es: "Guipuzcoa")
//            let beachCity: BeachDataMultilanguage = BeachDataMultilanguage(eu: "Eibar", es: "Eibar")
//            let beachLocation = BeachLocation(province: beachProvince, city: beachCity, lat: "", lng: "")
//            let beach = Beach(id: 2, name: beachName, description: beachDescription, location: beachLocation, webs: [])
//
//            cloudKitBeaches.append(beach)
//        }

        operation.queryCompletionBlock = { (cursor, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error: \(error)")
                } else {
                    self.provinceList = cloudKitBeaches
                }
            }
        }
        
        DataViewModel.database.add(operation)
    }
    
}
