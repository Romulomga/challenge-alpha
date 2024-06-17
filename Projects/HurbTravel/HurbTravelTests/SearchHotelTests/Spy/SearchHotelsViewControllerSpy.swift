//
//  SearchHotelsViewControllerSpy.swift
//  HurbTravelTests
//
//  Created by Matheus Ferreira on 16/06/24.
//

@testable import HurbTravel

class SearchHotelsViewControllerSpy: SearchHotelsDisplay {

    var invokedDisplayNewHotels = false
    var invokedDisplayNewHotelsCount = 0
    var invokedDisplayNewHotelsParameters: (viewModel: SearchHotelModel.Query.ViewModel, Void)?
    var invokedDisplayNewHotelsParametersList = [(viewModel: SearchHotelModel.Query.ViewModel, Void)]()

    func displayNewHotels(viewModel: SearchHotelModel.Query.ViewModel) {
        invokedDisplayNewHotels = true
        invokedDisplayNewHotelsCount += 1
        invokedDisplayNewHotelsParameters = (viewModel, ())
        invokedDisplayNewHotelsParametersList.append((viewModel, ()))
    }

    var invokedDisplayNoSearchResultsView = false
    var invokedDisplayNoSearchResultsViewCount = 0

    func displayNoSearchResultsView() {
        invokedDisplayNoSearchResultsView = true
        invokedDisplayNoSearchResultsViewCount += 1
    }

    var invokedDisplayErrorAlert = false
    var invokedDisplayErrorAlertCount = 0

    func displayErrorAlert() {
        invokedDisplayErrorAlert = true
        invokedDisplayErrorAlertCount += 1
    }

    var invokedDisplayHotelsDetails = false
    var invokedDisplayHotelsDetailsCount = 0

    func displayHotelsDetails() {
        invokedDisplayHotelsDetails = true
        invokedDisplayHotelsDetailsCount += 1
    }
}
