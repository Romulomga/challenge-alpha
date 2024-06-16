//
//  UICollectionReusableView.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

extension UICollectionReusableView {

    static var cellIdentifier: String {
        
        return String(describing: self)
    }
    
    static var nib: UINib {
        
        let bundle: Bundle = Bundle(for: self)
        
        let nib: UINib = UINib(
            nibName: self.cellIdentifier,
            bundle: bundle
        )
        
        return nib
    }
}
