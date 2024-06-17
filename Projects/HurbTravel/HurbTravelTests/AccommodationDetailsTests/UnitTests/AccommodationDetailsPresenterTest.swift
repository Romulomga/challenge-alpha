//
//  AccommodationDetailsPresenterTest.swift
//  HurbTravelTests
//
//  Created by Matheus Ferreira on 15/06/24.
//

import XCTest
@testable import HurbTravel

class AccommodationDetailsPresenterTest: XCTestCase {
    
    var sut: AccommodationDetailsPresentation!
    var viewControllerSpy: AccommodationDetailsViewControllerSpy!
    
    override func setUp() {
        
        self.viewControllerSpy = AccommodationDetailsViewControllerSpy()
        self.sut = AccommodationDetailsPresenter(viewController: self.viewControllerSpy)
    }
    
    func testPresentSetupView() {
        
        let product: Product = Product(url: nil, category: .hotel, description: "", medias: [], price: Price(amount: 0, currency: ""), location: Location(state: nil, country: nil, city: nil, text: nil), name: "", amenities: [])
        self.sut.presentSetupView(response: AccommodationDetails.Setup.Response(product: product))

        XCTAssertTrue(self.viewControllerSpy.invokedDisplaySetupView)
    }
    
    func testPresentShareProduct() {
        
        self.sut.presentShareProduct(response: AccommodationDetails.Share.Response(sharedText: ""))

        XCTAssertTrue(self.viewControllerSpy.invokedDisplayShareProduct)
    }
}
