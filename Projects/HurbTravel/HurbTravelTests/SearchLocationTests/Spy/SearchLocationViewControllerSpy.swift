//
//  SearchLocationViewControllerSpy.swift
//  HurbTravelTests
//
//  Created by Matheus Ferreira on 16/06/24.
//

@testable import HurbTravel

class SearchLocationViewControllerSpy: SearchLocationDisplay {

    var invokedDisplayLocations = false
    var invokedDisplayLocationsCount = 0
    var invokedDisplayLocationsParameters: (viewModel: SearchLocation.Setup.ViewModel, Void)?
    var invokedDisplayLocationsParametersList = [(viewModel: SearchLocation.Setup.ViewModel, Void)]()

    func displayLocations(viewModel: SearchLocation.Setup.ViewModel) {
        invokedDisplayLocations = true
        invokedDisplayLocationsCount += 1
        invokedDisplayLocationsParameters = (viewModel, ())
        invokedDisplayLocationsParametersList.append((viewModel, ()))
    }

    var invokedDisplayHideSkeleton = false
    var invokedDisplayHideSkeletonCount = 0

    func displayHideSkeleton() {
        invokedDisplayHideSkeleton = true
        invokedDisplayHideSkeletonCount += 1
    }

    var invokedDisplayErrorAlert = false
    var invokedDisplayErrorAlertCount = 0

    func displayErrorAlert() {
        invokedDisplayErrorAlert = true
        invokedDisplayErrorAlertCount += 1
    }
}
