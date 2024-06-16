//
//  AccommodationDetailsWorkerSpy.swift
//  HurbTravelTests
//
//  Created by Matheus Ferreira on 15/06/24.
//

@testable import HurbTravel

class AccommodationDetailsWorkerSpy: AccommodationDetailsWorker {

    var invokedDoSomeWork = false
    var invokedDoSomeWorkCount = 0

    override func doSomeWork() {
        invokedDoSomeWork = true
        invokedDoSomeWorkCount += 1
    }
}
