//
//  MainCoordinator.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 24/04/2021.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}

final class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // Go to the Main View Controller.
    func start() {
        let mainVC: MainViewController = MainViewController()
        mainVC.coordinator = self
        self.navigationController.pushViewController(mainVC, animated: false)
    }
    
    // Go to Maps View Controller.
    func goToMaps(provincesList: [Province]?) {
        let mapVC: MapViewController = MapViewController()
        mapVC.provincesList = provincesList
        self.navigationController.pushViewController(mapVC, animated: true)
    }
    
    // Go to Beach Detail View Controller.
    func goToBeachDetail(beach: Beach?) {
        let beachVC: BeachDetailViewController = BeachDetailViewController()
        beachVC.beach = beach
        self.navigationController.pushViewController(beachVC, animated: true)
    }
    
    // Go to Province Detail View Controller.
    func goToProvinceDetail(province: Province) {
        let provinceDetailVC: ProvinceDetailViewController = ProvinceDetailViewController()
        provinceDetailVC.province = province
        self.navigationController.pushViewController(provinceDetailVC, animated: true)
    }
}
