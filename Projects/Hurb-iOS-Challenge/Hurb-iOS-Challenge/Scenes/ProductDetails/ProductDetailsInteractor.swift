//
//  ProductDetailsInteractor.swift
//  Hurb-iOS-Challenge
//
//  Created by Rômulo Monteiro on 19/01/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ProductDetailsBusinessLogic {
    
    func setupView()
    func shareProduct()
}

protocol ProductDetailsDataStore {
    
    var product: Product? { get set }
}

class ProductDetailsInteractor: ProductDetailsBusinessLogic, ProductDetailsDataStore {
    
    var presenter: ProductDetailsPresentationLogic?
    var worker: ProductDetailsWorkerProtocol?
    
    var product: Product?
    
    init(presenter: ProductDetailsPresentationLogic, worker: ProductDetailsWorkerProtocol) {
        
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: Do something
    
    func setupView() {

        guard let product: Product = self.product else { return }
        
        let response: ProductDetails.Setup.Response = ProductDetails.Setup.Response(product: product)
        self.presenter?.presentSetupView(response: response)
    }
    
    func shareProduct() {
        
        guard let product: Product = self.product else { return }

        let response: ProductDetails.Share.Response = ProductDetails.Share.Response(sharedText: product.url ?? "")
        self.presenter?.presentShareProduct(response: response)
    }
}
