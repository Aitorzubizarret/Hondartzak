//
//  MapViewController.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 18/04/2021.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var mapView: UIView!
    
    // MARK: - Properties
    
    private var map: MKMapView {
        let width: CGFloat = self.mapView.bounds.width
        let height: CGFloat = self.mapView.bounds.height
        return MKMapView(frame: CGRect(x: 0, y: 0, width: width, height: height))
    }
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupMapView()
    }
    
    ///
    /// Setup the Map.
    ///
    private func setupMapView() {
        self.mapView.addSubview(map)
    }
}
