//
//  NumberFormatter+currencyFormat.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import Foundation

extension NumberFormatter {
    
    static func currencyFormat(from currency: String, fractionDigits: Int = 0) -> NumberFormatter {
        
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency
        formatter.maximumFractionDigits = fractionDigits
        formatter.locale = Locale.current
        
        return formatter
    }
}
