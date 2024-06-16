//
//  SearchProductWorker.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit
import HUGraphQL

enum ServiceError: Error {
    
    case emptyReturn
    case unknown(_ message: String)
}

protocol SearchProductWorkerProtocol {
    
    func searchProducts(term: String, page: Int, limit: Int, completion: @escaping (Result<Container, ServiceError>) -> Void)
}

class SearchProductWorker: SearchProductWorkerProtocol {
    
    func searchProducts(term: String, page: Int, limit: Int, completion: @escaping (Result<Container, ServiceError>) -> Void) {
        
        let pagination: HUGraphQL.SearchInputPagination = HUGraphQL.SearchInputPagination(page: page, limit: limit, sort: nil, sortOrder: nil)
        let query: HUGraphQL.SearchQuery = HUGraphQL.SearchQuery(q: term, pagination: pagination)
        
        let graphQL: HUGService = HUGService(enableLog: true)
        graphQL.client.fetch(query: query) { result in
            
            switch result {
                    
            case .success(let value):

                    if let listObject = value.data?.search?.resultMap,
                       let jsonData: Data = try? JSONSerialization.data(withJSONObject: listObject, options: .prettyPrinted),
                       let decoded: Container = try? JSONDecoder().decode(Container.self, from: jsonData) {

                        completion(.success(decoded))

                    } else {
                        
                        completion(.failure(.emptyReturn))
                    }
                break
                    
            case .failure(let error):
                    completion(.failure(.unknown(error.localizedDescription)))
                    break
            }
        }
    }
}

