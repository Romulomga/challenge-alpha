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
    
    // Feature image background highlight
    override var isHighlighted: Bool {
            
            didSet {
                
                self.toggleIsHighlighted()
            }
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.locationLabel.text = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.locationLabel.text = nil
    }
        // MARK: Utils

        private func toggleIsHighlighted() {
            
            UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseOut], animations: {
                
                self.alpha = self.isHighlighted ? 0.75 : 1.0
                self.transform = self.isHighlighted ?
                CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95) :
                CGAffineTransform.identity
            })
        }
    }
