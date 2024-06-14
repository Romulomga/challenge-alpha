//
//  ProductDetailsConfigurator.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

@objc class ProductDetailsConfigurator: NSObject {
    
    @objc static func setupArch(viewController: ProductDetailsViewController) {
        
        let presenter: ProductDetailsPresenter = ProductDetailsPresenter(viewController: viewController)
        let interactor: ProductDetailsInteractor = ProductDetailsInteractor(presenter: presenter, worker: ProductDetailsWorker())
        let router: ProductDetailsRouter = ProductDetailsRouter(viewController: viewController, dataStore: interactor)
        
        viewController.interactor = interactor
        viewController.router = router
    }
}

