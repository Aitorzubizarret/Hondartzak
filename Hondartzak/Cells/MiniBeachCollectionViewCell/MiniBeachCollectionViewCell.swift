//
//  MiniBeachCollectionViewCell.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 24/04/2021.
//

import UIKit

class MiniBeachCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var beachNameLabel: UILabel!
    
    // MARK: - Properties
    
    var beach: Beach? {
        didSet {
            guard let beach = self.beach else { return }
            
            self.beachNameLabel.text = beach.name.eu
        }
    }
    
    // MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
