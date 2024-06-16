//
//  SearchProductInteractor.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

class SearchHotelsInteractor: SearchHotelsBusinessLogic, SearchHotelsDataStore {
    
    var presenter: SearchHotelsPresentationLogic?
    var worker: SearchHotelsProtocols?

    var product: Product?

    init(presenter: SearchHotelsPresentationLogic, worker: SearchHotelsProtocols) {
        
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: Do something
    
    func searchHotels(request: SearchProduct.Query.Request) {
        
        self.worker?.searchHotels(term: request.term, page: request.page, limit: request.limit, completion: { result in
            
            switch result {
                    
                case .success(let container):
                    
                    if let products: [Product] = container.products, products.count > 0 {
                        
                        let response: SearchProduct.Query.Response = SearchProduct.Query.Response(pagination: container.pagination, products: products)
                        self.presenter?.presentNewHotels(response: response)
                    } else if request.page <= 1 {
                        
                        self.presenter?.presentNoSearchResultsView()
                    }
                    break
                    
                case .failure( _):
                    self.presenter?.presentErrorAlert()
                    break
            }
        })
    }
    
    func didSelectedHotel(request: SearchProduct.Selection.Request) {
        
        self.product = request.product
        
        self.presenter?.presentHotelsDetails()
    }
}

