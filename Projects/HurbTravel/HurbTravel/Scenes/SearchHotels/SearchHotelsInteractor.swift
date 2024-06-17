//
//  SearchProductInteractor.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

protocol SearchHotelsLogic {
    
    func searchHotels(request: SearchHotelModel.Query.Request)
    func didSelectedHotel(request: SearchHotelModel.SelectionRequest)
}

protocol SearchHotelsDataStore {
    
    var product: Product? { get set }
}

class SearchHotelsInteractor: SearchHotelsLogic, SearchHotelsDataStore {
    
    var presenter: SearchHotelsPresentation?
    var worker: SearchHotelsProtocols?

    var product: Product?

    init(presenter: SearchHotelsPresentation, worker: SearchHotelsProtocols) {
        
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: Do something
    
    func searchHotels(request: SearchHotelModel.Query.Request) {
        
        self.worker?.searchHotels(term: request.term, page: request.page, limit: request.limit, completion: { result in
            
            switch result {
                    
                case .success(let container):
                    
                    if let products: [Product] = container.products, products.count > 0 {
                        
                        let response: SearchHotelModel.Query.Response = SearchHotelModel.Query.Response(pagination: container.pagination, products: products)
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
    
    func didSelectedHotel(request: SearchHotelModel.SelectionRequest) {
        
        self.product = request.product
        
        self.presenter?.presentHotelsDetails()
    }
}

