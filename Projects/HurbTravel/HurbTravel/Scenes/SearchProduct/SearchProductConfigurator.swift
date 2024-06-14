//
//  SearchProductConfigurator.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

@objc class SearchProductConfigurator: NSObject {
    
    @objc static func setupArch(viewController: SearchProductViewController) {
        
        let presenter: SearchProductPresenter = SearchProductPresenter(viewController: viewController)
        let interactor: SearchProductInteractor = SearchProductInteractor(presenter: presenter, worker: SearchProductWorker())
        let router: SearchProductRouter = SearchProductRouter(viewController: viewController, dataStore: interactor)
        
        viewController.interactor = interactor
        viewController.router = router
    }
}
