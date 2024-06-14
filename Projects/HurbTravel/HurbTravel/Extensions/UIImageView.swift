//
//  UIImageView.swift
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
        
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 20)
        
        self.kf.indicatorType = .activity
        
        DispatchQueue.main.async {
            
            self.kf.setImage(
                with: anUrl,
                placeholder: placeholderImage,
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ],
                completionHandler: { [weak self] result in
                    
                    switch result {
                        case .success(let value):
                            let image = value.image
                            // Perform image aspect ratio adjustment here if needed
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
