//
//  AccommodationDetailsViewControllerSpy.swift
//  HurbTravelTests
//
//  Created by Matheus Ferreira on 15/06/24.
//

import UIKit
@testable import HurbTravel

class AccommodationDetailsViewControllerSpy: AccommodationDetailsDisplayLogic {

        var invokedDisplaySetupView = false
        var invokedDisplaySetupViewCount = 0
        var invokedDisplaySetupViewParameters: (viewModel: AccommodationDetails.Setup.ViewModel, Void)?
        var invokedDisplaySetupViewParametersList = [(viewModel: AccommodationDetails.Setup.ViewModel, Void)]()

        func displaySetupView(viewModel: AccommodationDetails.Setup.ViewModel) {
            invokedDisplaySetupView = true
            invokedDisplaySetupViewCount += 1
            invokedDisplaySetupViewParameters = (viewModel, ())
            invokedDisplaySetupViewParametersList.append((viewModel, ()))
        }

        var invokedDisplayShareProduct = false
        var invokedDisplayShareProductCount = 0
        var invokedDisplayShareProductParameters: (viewModel: AccommodationDetails.Share.ViewModel, Void)?
        var invokedDisplayShareProductParametersList = [(viewModel: AccommodationDetails.Share.ViewModel, Void)]()

        func displayShareProduct(viewModel: AccommodationDetails.Share.ViewModel) {
            invokedDisplayShareProduct = true
            invokedDisplayShareProductCount += 1
            invokedDisplayShareProductParameters = (viewModel, ())
            invokedDisplayShareProductParametersList.append((viewModel, ()))
        }
    }
