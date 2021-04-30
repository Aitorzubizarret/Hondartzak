//
//  BeachTableViewCell.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 30/04/2021.
//

import UIKit

class BeachTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var beachNameLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    
    // MARK: - Properties
    
    var beachName: String = "" {
        didSet {
            self.beachNameLabel.text = self.beachName
        }
    }
    var cityName: String = "" {
        didSet {
            self.cityNameLabel.text = self.cityName
        }
    }
    
    // MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
