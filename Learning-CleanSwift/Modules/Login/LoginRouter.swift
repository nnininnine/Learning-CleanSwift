//
//  LoginRouter.swift
//  Learning-CleanSwift
//
//  Created by 7Peaks on 17/6/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol LoginRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    func routeToMain(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing
{
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    func routeToMain(segue: UIStoryboardSegue?) {
        if let segue = segue {
            guard let destinationVC = segue.destination as? MainViewController else { return }
            var destinationDS = destinationVC.router!.dataStore!
            passDataToMain(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let destinationVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
            var destinationDS = destinationVC.router!.dataStore!
            passDataToMain(source: dataStore!, destination: &destinationDS)
            navigateToMain(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: LoginViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    func navigateToMain(source: LoginViewController, destination: MainViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: LoginDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
    
    func passDataToMain(source: LoginDataStore, destination: inout MainDataStore){
        destination.name = source.name
    }
}
