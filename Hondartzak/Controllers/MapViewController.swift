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
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Properties
    
    private var map: MKMapView {
        let width: CGFloat = self.mapView.bounds.width
        let height: CGFloat = self.mapView.bounds.height
        return MKMapView(frame: CGRect(x: 0, y: 0, width: width, height: height))
    }
    let miniBeachCollectionViewCellIdentifier: String = "miniBeachCollectionViewCellIdentifier"
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView()
    }
    
    ///
    /// Setup the View.
    ///
    private func setupView() {
        // Map view.
        self.mapView.addSubview(map)
        
        // CollectionView.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        // Layout.
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 10
        }
        
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.backgroundColor = UIColor.clear
        collectionView!.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        // Register cells.
        let miniBeachCell: UINib = UINib(nibName: "MiniBeachCollectionViewCell", bundle: nil)
        self.collectionView.register(miniBeachCell, forCellWithReuseIdentifier: self.miniBeachCollectionViewCellIdentifier)
    }
}

// MARK: - UICollectionView Delegate

extension MapViewController: UICollectionViewDelegate {}

// MARK: - UICollectionView DataSource

extension MapViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.miniBeachCollectionViewCellIdentifier, for: indexPath) as! MiniBeachCollectionViewCell
        return cell
    }
    
}

// MARK: - UICollectionView Delegate FlowLayout

extension MapViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let totalWidth = self.collectionView.layer.bounds.size.width
//        let cellWidth = (totalWidth - (2 * 10)) / 2.2
//        let cellHeight = self.collectionView.layer.bounds.size.height
        return CGSize(width: 80, height: 80)
    }
    
}
