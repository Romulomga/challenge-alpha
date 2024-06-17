//
//  SearchLocationRouter.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

@objc protocol SearchLocationRouting {
    
    func routeTo(segue: UIStoryboardSegue, sender: Any?)
}

class SearchLocationRouter: NSObject, SearchLocationRouting {
    
    weak var viewController: SearchLocationViewController?
    
    init(viewController: SearchLocationViewController) {
        
        self.viewController = viewController
    }
    
    // MARK: Route to
    
    func routeTo(segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
