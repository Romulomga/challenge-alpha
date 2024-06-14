//
//  SearchLocationCollectionView.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

class SearchLocationCollectionViewCell: UICollectionViewCell {

    // MARK: Outlets

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
        // Initialization code

        self.locationLabel.text = nil
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.locationLabel.text = nil
    }
    
    override var isHighlighted: Bool {
        
        didSet {
            
            self.toggleIsHighlighted()
        }
    }
    
    // MARK: Utils

    private func toggleIsHighlighted() {
        
        UIView.animate(withDuration: 0.1, delay: 0, animations: {
            
            self.backgroundColor = (self.isHighlighted) ? .systemGray3 : .systemBackground
        })
    }
}
