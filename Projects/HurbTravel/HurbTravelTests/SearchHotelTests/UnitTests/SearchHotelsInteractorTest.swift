//
//  SearchHotelsInteractorTest.swift
//  HurbTravelTests
//
//  Created by Matheus Ferreira on 16/06/24.
//

import XCTest
@testable import HurbTravel

class SearchHotelsInteractorTest: XCTestCase {
    
    var sut: SearchHotelsInteractor!
    var workerSpy: SearchHotelsWorkerSpy!
    var presenterSpy: SearchHotelsPresenterSpy!
    
    override func setUp() {
        
        self.workerSpy = SearchHotelsWorkerSpy()
        self.presenterSpy = SearchHotelsPresenterSpy()
        self.sut = SearchHotelsInteractor(presenter: self.presenterSpy, worker: self.workerSpy)
    }
    
    func testSearchHotelsSuccess() {
        
        self.workerSpy.stubbedSearchHotelsCompletionResult = (.success(Container(pagination: nil, products: [Product(url: nil, category: .hotel, description: "", medias: [], price: Price(amount: 0, currency: ""), location: Location(state: nil, country: nil, city: nil, text: nil), name: "", amenities: [])])), ())

        self.sut?.searchHotels(request: SearchHotelModel.Query.Request(term: "teste", page: 1, limit: 10))
        XCTAssertTrue(self.presenterSpy.invokedPresentNewHotels)
    }

    func testSearchHotelsSuccessWithEmptyHotelsInFirstPage() {
        
        self.workerSpy.stubbedSearchHotelsCompletionResult = (.success(Container(pagination: nil, products: nil)), ())

        self.sut?.searchHotels(request: SearchHotelModel.Query.Request(term: "teste", page: 1, limit: 10))
        XCTAssertTrue(self.presenterSpy.invokedPresentNoSearchResultsView)
    }
    
    func testSearchHotelsFailure() {
        
        self.workerSpy.stubbedSearchHotelsCompletionResult = (.failure(.emptyReturn), ())

        self.sut?.searchHotels(request: SearchHotelModel.Query.Request(term: "teste", page: 1, limit: 10))
        XCTAssertTrue(self.presenterSpy.invokedPresentErrorAlert)
    }
    
    func testSelectingAProduct() {
        
        let product: Product = Product(url: nil, category: .hotel, description: "", medias: [], price: Price(amount: 0, currency: ""), location: Location(state: nil, country: nil, city: nil, text: nil), name: "", amenities: [])
        self.sut?.didSelectedHotel(request: SearchHotelModel.Selection.Request(product: product))
        
        XCTAssertEqual(product, self.sut.product)
    }
}
