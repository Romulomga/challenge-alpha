//
//  SearchLocationInteractor.swift
//  Hurb-iOS-Challenge
//
//  Created by Rômulo Monteiro on 17/01/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SearchLocationBusinessLogic {
    
    func searchTerm(request: SearchLocation.Setup.Request)
}

protocol SearchLocationDataStore {
    
    //var name: String { get set }
}

class SearchLocationInteractor: SearchLocationBusinessLogic, SearchLocationDataStore {
    
    var presenter: SearchLocationPresentationLogic?
    var worker: SearchLocationWorkerProtocol?
    lazy var term: String = ""
    
    init(presenter: SearchLocationPresentationLogic, worker: SearchLocationWorkerProtocol) {
        
        self.presenter = presenter
        self.worker = worker
    }
    
    // MARK: Do something
    
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
