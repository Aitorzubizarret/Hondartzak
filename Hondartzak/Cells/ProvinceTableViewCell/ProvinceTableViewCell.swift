//
//  ProvinceTableViewCell.swift
//  Hondartzak
//
//  Created by Aitor Zubizarreta Perez on 21/04/2021.
//

import UIKit

class ProvinceTableViewCell: UITableViewCell {
    
    // MARK: - UI Elements
    
    @IBOutlet weak var provinceNameLabel: UILabel!
    @IBOutlet weak var goToAllProvincesListButton: UIButton!
    @IBAction func goToAllProvincesListButtonTapped(_ sender: Any) {
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    weak var coordinator: MainCoordinator?
    var province: Province? {
        didSet {
            guard let province = province else { return }
            
            self.provinceNameLabel.text = province.name.eu
            
            for city in province.cities {
                for beach in city.beaches {
                    self.beaches.append(beach)
                    self.cityNames.append(city.name.eu)
                }
            }
            
            self.collectionView.reloadData()
        }
    }
    var beaches: [Beach] = []
    var cityNames: [String] = []
    let beachCollectionViewCellIdentifier: String = "beachCollectionViewCellIdentifier"
    
    // MARK: - Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        self.setupCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    ///
    /// Setup the CollectionView.
    ///
    private func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        // Layout.
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 10
        }
        
        self.collectionView.showsHorizontalScrollIndicator = false
        
        // Register cells.
        let beachCell: UINib = UINib(nibName: "BeachCollectionViewCell", bundle: nil)
        self.collectionView.register(beachCell, forCellWithReuseIdentifier: self.beachCollectionViewCellIdentifier)
    }
    
}

// MARK: - UICollectionView Delegate

extension ProvinceTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.coordinator?.goToBeachDetail()
    }
    
}

// MARK: - UICollectionView Data Source

extension ProvinceTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.beaches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: self.beachCollectionViewCellIdentifier, for: indexPath) as! BeachCollectionViewCell
        cell.beach = self.beaches[indexPath.row]
        cell.cityName = self.cityNames[indexPath.row]
        return cell
    }
    
}

// MARK: - UICollectionView Delegate FlowLayout

extension ProvinceTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalWidth = self.collectionView.layer.bounds.size.width
        let cellWidth = (totalWidth - (2 * 10)) / 2.2
        let cellHeight = self.collectionView.layer.bounds.size.height
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}
