//
//  MapTableViewCell.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 18/04/2021.
//

import UIKit

class MapTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var tempLabel: UILabel!
    
    // MARK: - Properties
    
    // MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
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
        self.tempLabel.text = "Map"
    }
}
