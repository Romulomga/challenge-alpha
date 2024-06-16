//
//  SearchHotelsPresenterTest.swift
//  HurbTravelTests
//
//  Created by Matheus Ferreira on 16/06/24.
//

import XCTest
@testable import HurbTravel

class SearchHotelsPresenterTest: XCTestCase {
    
    var sut: SearchLocationPresentation!
    var viewControllerSpy: SearchLocationViewControllerSpy!
    
    override func setUp() {
        
        self.viewControllerSpy = SearchLocationViewControllerSpy()
        self.sut = SearchLocationPresenter(viewController: self.viewControllerSpy)
    }
    
    func testPresentLocations() {
        
        self.sut.presentLocations(response: SearchLocation.Setup.Response(locations: [""]))
        
        XCTAssertTrue(self.viewControllerSpy.invokedDisplayLocations)
    }
    
    func testPresentHideSkeleton() {
        
        self.sut.presentHideSkeleton()
        
        XCTAssertTrue(self.viewControllerSpy.invokedDisplayHideSkeleton)
    }
    
    func testPresentErrorAlert() {
        
        self.sut.presentErrorAlert()
        
        XCTAssertTrue(self.viewControllerSpy.invokedDisplayErrorAlert)
    }
}
