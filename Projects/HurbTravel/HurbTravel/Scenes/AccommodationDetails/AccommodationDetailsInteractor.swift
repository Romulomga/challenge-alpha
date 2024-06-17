//
//  AccommodationDetailsInteractor.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

class AccommodationDetailsInteractor: AccommodationDetailsBusinessLogic, AccommodationDetailsDataStore {
    
    var presenter: AccommodationDetailsPresentationLogic?
    var product: Product?
    
    init(presenter: AccommodationDetailsPresentationLogic) {
        
        self.presenter = presenter

    }
    
    // MARK: Do something
    
    func buildSetup() {

        guard let product: Product = self.product else { return }
        
        let response: AccommodationDetails.Setup.Response = AccommodationDetails.Setup.Response(product: product)
        self.presenter?.presentSetupView(response: response)
    }
    
    func shareProduct() {
        
        guard let product: Product = self.product else { return }

        let response: AccommodationDetails.Share.Response = AccommodationDetails.Share.Response(sharedText: product.url ?? "")
        self.presenter?.presentShareProduct(response: response)
    }
}
