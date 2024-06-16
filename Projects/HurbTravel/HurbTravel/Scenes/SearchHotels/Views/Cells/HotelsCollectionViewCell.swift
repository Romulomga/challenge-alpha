//
//  HotelsCollectionViewCell.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit
import Kingfisher

class HotelsCollectionViewCell: UICollectionViewCell {
    
    // MARK: Outlets
    
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var topPriceLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var bottomPriceLabel: UILabel!
    @IBOutlet private weak var firstAmenityView: UIView!
    @IBOutlet private weak var firstAmenityLabel: UILabel!
    @IBOutlet private weak var secondAmenityView: UIView!
    @IBOutlet private weak var secondAmenityLabel: UILabel!
    
    // MARK: Properties
    
    var product: Product? {
        
        didSet {
            
            guard let product: Product = self.product else { return }
            
            self.photoImageView.loadPhoto(url: product.medias.first?.url) {
                
                self.setNeedsLayout()
            }
            
            self.nameLabel.text = "\(product.name) - \(product.category.rawValue ?? "")"
            self.addressLabel.text = product.getFormattedAddress()
            self.topPriceLabel.text = product.getPriceTopText()
            self.priceLabel.text = product.getFormattedPrice()
            self.bottomPriceLabel.text = product.getPriceBottomText()
            
            if let firstAmenity: Amenity = product.amenities.first {
                
                self.firstAmenityView.isHidden = false
                self.firstAmenityLabel.text = firstAmenity.name
            }
            
            if let secondAmenity: Amenity = product.amenities.last {
                
                self.secondAmenityView.isHidden = false
                self.secondAmenityLabel.text = secondAmenity.name
            }
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
        
        self.firstAmenityView.isHidden = true
        self.secondAmenityView.isHidden = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.photoImageView.prepareForReuse()
        self.firstAmenityView.isHidden = true
        self.secondAmenityView.isHidden = true
    }
        
        // MARK: Utils

        private func toggleIsHighlighted() {
            
            UIView.animate(withDuration: 0.1, delay: 0, animations: {
                
                self.backgroundColor = (self.isHighlighted) ? .systemGray3 : .systemBackground
            })
        }
    }
