//
//  SearchLocationCollectionView.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

class SearchLocationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var locationLabel: UILabel!
    
    var location: String? {
        
        didSet {
            
            guard let location: String = self.location else { return }
            
            self.locationLabel.text = location
        }
    }
    
    // MARK: Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.locationLabel.text = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.locationLabel.text = nil
    }
}
