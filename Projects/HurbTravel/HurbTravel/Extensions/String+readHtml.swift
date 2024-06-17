//
//  String+readHtml.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import Foundation

extension String {
    
    var readHtml: String? {
        
        let newString: String = self.replacingOccurrences(of: "\n", with: "<br>")
        guard let data = newString.data(using: .unicode, allowLossyConversion: false) else {
            
            return nil
        }
        
        return try? NSAttributedString(
            data: data,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
        ).string
    }
}

