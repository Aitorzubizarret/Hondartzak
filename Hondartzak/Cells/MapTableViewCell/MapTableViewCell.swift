//
//  MapTableViewCell.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 18/04/2021.
//

import UIKit
import MapKit

class MapTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mapImageView: UIImageView!
    @IBOutlet weak var titleBackgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Properties
    
    var snapShotter: MKMapSnapshotter {
        let mapSnapshotOptions = MKMapSnapshotter.Options()

        // Set the region of the map that is rendered.
        let location = CLLocationCoordinate2DMake(43.305709,-2.366432) // Apple HQ
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
        mapSnapshotOptions.region = region

        // Set the scale of the image. We'll just use the scale of the current device, which is 2x scale on Retina screens.
        mapSnapshotOptions.scale = UIScreen.main.scale

        // Set the size of the image output.
        mapSnapshotOptions.size = CGSize(width: 500, height: 100)

        // Show buildings and Points of Interest on the snapshot
        mapSnapshotOptions.showsBuildings = true
        mapSnapshotOptions.showsPointsOfInterest = true

        return MKMapSnapshotter(options: mapSnapshotOptions)
    }
    
    // MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        self.setuptView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    ///
    /// Setup the View.
    ///
    private func setuptView() {
        // View.
        self.mainView.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
        self.mainView.layer.cornerRadius = 10
        self.mainView.layer.masksToBounds = true
        
        // ImageView.
        self.mapImageView.contentMode = .scaleAspectFill
        self.snapShotter.start { (snapshot, error) in
            if error == nil {
                self.mapImageView.image = snapshot?.image
            } else {
                print("Error snapshot")
            }
        }
        
        // View.
        self.titleBackgroundView.backgroundColor = UIColor.red.withAlphaComponent(0)
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.blue.cgColor, UIColor.white.withAlphaComponent(0).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.titleBackgroundView.frame.size.width, height: self.titleBackgroundView.frame.size.height)
        self.titleBackgroundView.layer.insertSublayer(gradient, at: 0)
        
        // Label.
        self.titleLabel.text = "Map"
    }
}
