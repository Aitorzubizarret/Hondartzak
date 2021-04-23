//
//  BeachCollectionViewCell.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 22/04/2021.
//

import UIKit

class BeachCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var beachNameLabel: UILabel!
    
    // MARK: - Properties
    
    var beach: Beach? {
        didSet {
            guard let beach = beach else { return }
            
            self.beachNameLabel.text = beach.name.eu
        }
    }
    var cityName: String? {
        didSet {
            guard let cityName = cityName else { return }
            
            self.cityNameLabel.text = cityName
        }
    }
    
    // MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setupView()
    }
    
    ///
    /// Setup the View.
    ///
    private func setupView() {
        self.mainView.layer.cornerRadius = 6
    }
}
