//
//  SearchHotelsWorkerSpy.swift
//  HurbTravelTests
//
//  Created by Matheus Ferreira on 16/06/24.
//

@testable import HurbTravel

class SearchHotelsWorkerSpy: SearchHotelsWorker {

    var invokedSearchHotels = false
    var invokedSearchHotelsCount = 0
    var invokedSearchHotelsParameters: (term: String, page: Int, limit: Int)?
    var invokedSearchHotelsParametersList = [(term: String, page: Int, limit: Int)]()
    var stubbedSearchHotelsCompletionResult: (Result<Container, ServiceError>, Void)?

    func searchHotel(term: String, page: Int, limit: Int, completion: @escaping (Result<Container, ServiceError>) -> Void) {
        invokedSearchHotels = true
        invokedSearchHotelsCount += 1
        invokedSearchHotelsParameters = (term, page, limit)
        invokedSearchHotelsParametersList.append((term, page, limit))
        if let result = stubbedSearchHotelsCompletionResult {
            completion(result.0)
        }
    }
}
