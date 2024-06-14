//
//  ProductDetailsInteractor.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
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
    var worker: ProductsDetailsWorkerProtocol?
    
    var product: Product?
    
    init(presenter: ProductDetailsPresentationLogic, worker: ProductsDetailsWorkerProtocol) {
        
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

