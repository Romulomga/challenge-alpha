//
//  SearchLocationPresenterSpy.swift
//  HurbTravelTests
//
//  Created by Matheus Ferreira on 16/06/24.
//

@testable import HurbTravel

class SearchLocationPresenterSpy: SearchLocationPresentation {

    var invokedPresentLocations = false
    var invokedPresentLocationsCount = 0
    var invokedPresentLocationsParameters: (response: SearchLocation.Setup.Response, Void)?
    var invokedPresentLocationsParametersList = [(response: SearchLocation.Setup.Response, Void)]()

    func presentLocations(response: SearchLocation.Setup.Response) {
        invokedPresentLocations = true
        invokedPresentLocationsCount += 1
        invokedPresentLocationsParameters = (response, ())
        invokedPresentLocationsParametersList.append((response, ()))
    }

    var invokedPresentHideSkeleton = false
    var invokedPresentHideSkeletonCount = 0

    func presentHideSkeleton() {
        invokedPresentHideSkeleton = true
        invokedPresentHideSkeletonCount += 1
    }

    var invokedPresentErrorAlert = false
    var invokedPresentErrorAlertCount = 0

    func presentErrorAlert() {
        invokedPresentErrorAlert = true
        invokedPresentErrorAlertCount += 1
    }
}
