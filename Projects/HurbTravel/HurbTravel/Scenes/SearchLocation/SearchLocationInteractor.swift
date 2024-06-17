//
//  SearchLocationInteractor.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

protocol SearchLocationLogic {
    
    func searchTerm(request: SearchLocation.Setup.Request)
}

class SearchLocationInteractor: SearchLocationLogic {
    
    var presenter: SearchLocationPresentation?
    var worker: SearchLocationProtocols?
    lazy var term: String = ""
    
    init(presenter: SearchLocationPresentation, worker: SearchLocationProtocols) {
        
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: Do
    
    func searchTerm(request: SearchLocation.Setup.Request) {
        
        if request.term == self.term && request.term.count > 3 {
            
            self.presenter?.presentHideSkeleton()
            return
        }
        
        self.term = request.term
        
        self.worker?.searchLocations(term: request.term, limit: request.limit, completion: { result in
            
            switch result {
                    
                case .success(let locations):
                    
                    self.presenter?.presentHideSkeleton()

                    if let locations: [Location] = locations, locations.count > 0 {
                        
                        let response = SearchLocation.Setup.Response(locations: locations.compactMap({ $0.text }))
                        self.presenter?.presentLocations(response: response)
                    }
                    break
                    
                case .failure( _):
                    self.presenter?.presentHideSkeleton()
                    self.presenter?.presentErrorAlert()
                    break
            }
        })
    }
}
