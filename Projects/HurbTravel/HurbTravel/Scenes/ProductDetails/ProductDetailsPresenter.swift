//
//  ProductDetailsPresenter.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

protocol ProductDetailsPresentationLogic {
    
    func presentSetupView(response: ProductDetails.Setup.Response)
    func presentShareProduct(response: ProductDetails.Share.Response)
}

class ProductDetailsPresenter: ProductDetailsPresentationLogic {
    
    weak var viewController: ProductDetailsDisplayLogic?
    
    init(viewController: ProductDetailsDisplayLogic) {
        
        self.viewController = viewController
    }
    
    // MARK: Setup
    
    func presentSetupView(response: ProductDetails.Setup.Response) {

        let viewModel: ProductDetails.Setup.ViewModel = ProductDetails.Setup.ViewModel(product: response.product, descriptionTitle: "Detalhes do \((response.product.category.rawValue ?? "").lowercased())")
        self.viewController?.displaySetupView(viewModel: viewModel)
    }
    
    // MARK: Share

    func presentShareProduct(response: ProductDetails.Share.Response) {
        
        let viewModel: ProductDetails.Share.ViewModel = ProductDetails.Share.ViewModel(sharedText: response.sharedText)
        self.viewController?.displayShareProduct(viewModel: viewModel)
    }
}

