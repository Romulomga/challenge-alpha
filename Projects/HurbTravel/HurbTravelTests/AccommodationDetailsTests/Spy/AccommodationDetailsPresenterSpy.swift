//
//  AccommodationDetailsPresenterSpy.swift
//  HurbTravelTests
//
//  Created by Matheus Ferreira on 15/06/24.
//

import XCTest
@testable import HurbTravel

class AccommodationDetailsPresenterSpy: AccommodationDetailsPresentationLogic {

    var invokedPresentSetupView = false
    var invokedPresentSetupViewCount = 0
    var invokedPresentSetupViewParameters: (response: AccommodationDetails.Setup.Response, Void)?
    var invokedPresentSetupViewParametersList = [(response: AccommodationDetails.Setup.Response, Void)]()

    func presentSetupView(response: AccommodationDetails.Setup.Response) {
        invokedPresentSetupView = true
        invokedPresentSetupViewCount += 1
        invokedPresentSetupViewParameters = (response, ())
        invokedPresentSetupViewParametersList.append((response, ()))
    }

    var invokedPresentShareProduct = false
    var invokedPresentShareProductCount = 0
    var invokedPresentShareProductParameters: (response: AccommodationDetails.Share.Response, Void)?
    var invokedPresentShareProductParametersList = [(response: AccommodationDetails.Share.Response, Void)]()

    func presentShareProduct(response: AccommodationDetails.Share.Response) {
        invokedPresentShareProduct = true
        invokedPresentShareProductCount += 1
        invokedPresentShareProductParameters = (response, ())
        invokedPresentShareProductParametersList.append((response, ()))
    }
}
