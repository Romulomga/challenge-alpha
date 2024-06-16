//
//  SearchProductConfigurator.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

@objc class SearchHotelsConfigurator: NSObject {
    
    @objc static func setupArch(viewController: SearchHotelsViewController) {
        
        let presenter: SearchHotelsPresenter = SearchHotelsPresenter(viewController: viewController)
        let interactor: SearchHotelsInteractor = SearchHotelsInteractor(presenter: presenter, worker: SearchHotelsWorker())
        let router: SearchProductRouter = SearchProductRouter(viewController: viewController, dataStore: interactor)
        
        viewController.interactor = interactor
        viewController.router = router
    }
}
