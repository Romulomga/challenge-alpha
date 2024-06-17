//
//  SearchHotelsPresenterSpy.swift
//  HurbTravelTests
//
//  Created by Matheus Ferreira on 16/06/24.
//

@testable import HurbTravel

class SearchHotelsPresenterSpy: SearchHotelsPresentation {

    var invokedPresentNewHotels = false
    var invokedPresentNewHotelsCount = 0
    var invokedPresentNewHotelsParameters: (response: SearchHotelModel.Query.Response, Void)?
    var invokedPresentNewHotelsParametersList = [(response: SearchHotelModel.Query.Response, Void)]()

    func presentNewHotels(response: SearchHotelModel.Query.Response) {
        invokedPresentNewHotels = true
        invokedPresentNewHotelsCount += 1
        invokedPresentNewHotelsParameters = (response, ())
        invokedPresentNewHotelsParametersList.append((response, ()))
    }

    var invokedPresentNoSearchResultsView = false
    var invokedPresentNoSearchResultsViewCount = 0

    func presentNoSearchResultsView() {
        invokedPresentNoSearchResultsView = true
        invokedPresentNoSearchResultsViewCount += 1
    }

    var invokedPresentErrorAlert = false
    var invokedPresentErrorAlertCount = 0

    func presentErrorAlert() {
        invokedPresentErrorAlert = true
        invokedPresentErrorAlertCount += 1
    }

    var invokedPresentHotelsDetails = false
    var invokedPresentHotelsDetailsCount = 0

    func presentHotelsDetails() {
        invokedPresentHotelsDetails = true
        invokedPresentHotelsDetailsCount += 1
    }
}
