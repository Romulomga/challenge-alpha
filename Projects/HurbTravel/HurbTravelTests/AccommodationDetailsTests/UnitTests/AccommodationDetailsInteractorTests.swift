//
//  AccommodationDetailsInteractorTests.swift
//  HurbTravelTests
//
//  Created by Matheus Ferreira on 15/06/24.
//

import XCTest
@testable import HurbTravel

class AccommodationDetailsInteractorTests: XCTestCase {
        
        var sut: AccommodationDetailsInteractor!
        var workerSpy: AccommodationDetailsWorkerSpy!
        var presenterSpy: AccommodationDetailsPresenterSpy!
        
        override func setUp() {
            super.setUp()
            self.workerSpy = AccommodationDetailsWorkerSpy()
            self.presenterSpy = AccommodationDetailsPresenterSpy()
            self.sut = AccommodationDetailsInteractor(presenter: self.presenterSpy, worker: self.workerSpy)
        }
        
        override func tearDown() {
            self.sut = nil
            self.workerSpy = nil
            self.presenterSpy = nil
            super.tearDown()
        }

        func testBuildSetup() {
            self.sut.product = Product(url: nil, category: .hotel, description: "", medias: [], price: Price(amount: 0, currency: ""), location: Location(state: nil, country: nil, city: nil, text: nil), name: "", amenities: [])
            self.sut.buildSetup()
            
            XCTAssertTrue(self.presenterSpy.invokedPresentSetupView)
        }

        func testShareProduct() {
            self.sut.product = Product(url: nil, category: .hotel, description: "", medias: [], price: Price(amount: 0, currency: ""), location: Location(state: nil, country: nil, city: nil, text: nil), name: "", amenities: [])
            self.sut.shareProduct()

            XCTAssertTrue(self.presenterSpy.invokedPresentShareProduct)
        }
    }
