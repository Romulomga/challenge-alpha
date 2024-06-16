//
//  ProductDetailsConfigurator.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

@objc class AccommodationDetailsConfigurator: NSObject {
    
    @objc static func setup(viewController: AccommodationDetailsViewController) {
        
        let presenter: AccommodationDetailsPresenter = AccommodationDetailsPresenter(viewController: viewController)
        let interactor: AccommodationDetailsInteractor = AccommodationDetailsInteractor(presenter: presenter, worker: AccommodationDetailsWorker())
        let router: AccommodationDetailsRouter = AccommodationDetailsRouter(viewController: viewController, dataStore: interactor)
        
        viewController.interactor = interactor
        viewController.router = router
    }
}
