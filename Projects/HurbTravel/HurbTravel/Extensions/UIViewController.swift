//
//  UIViewController.swift
//  HurbTravel
//
//  Created by Matheus Ferreira on 13/06/24.
//

import UIKit

extension UIViewController {
    
    class func newInstanceFromStoryboard<T: UIViewController>(
        storyboardName: String,
        storyboardId: String) -> T {
                    
        let storyboard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller: T = storyboard.instantiateViewController(withIdentifier: storyboardId) as! T
        
        return controller
    }
}
