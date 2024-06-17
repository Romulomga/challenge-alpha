//
//  UIImageView+loadPhoto.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func loadPhoto(url: String?, completion: (() -> Void)? = nil) {
        
        guard let imageUrl = url, let anUrl = URL(string: imageUrl) else { return }
        
        let placeholderImage = UIImage(named: "placeholder_image_name")
        
        let imageProcessor = DownsamplingImageProcessor(size: self.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 10)
        
        self.kf.indicatorType = .activity
        
        DispatchQueue.main.async {
            
            self.kf.setImage(
                with: anUrl,
                placeholder: placeholderImage,
                options: [
                    .processor(imageProcessor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ],
                completionHandler: { [weak self] result in
                    
                    switch result {
                    case .success(_):
                        self?.contentMode = .scaleAspectFit
                    case .failure(let error):
                        print("Error loading image: \(error)")
                    }
                    
                    completion?()
                })
        }
    }
    
    func prepareForReuse() {
        
        self.kf.cancelDownloadTask()
        self.contentMode = .scaleAspectFit
        self.image = nil
    }
}
