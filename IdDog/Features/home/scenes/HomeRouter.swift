//
//  HomeRouter.swift
//  IdDog
//
//  Created by Caique on 29/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

@objc protocol HomeRoutingLogic {
    func routeToDogList(segue: UIStoryboardSegue?)
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    // MARK: Routing
    func routeToDogList(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! DogListViewController
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToDogList(source: dataStore!, destination: &destinationDS)
        } else {
//            let storyboard = UIStoryboard(name: "DogList", bundle: nil)
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "DogList")
            let storyboard = UIStoryboard(name: "DogList", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DogListView")
//            navigationController?.pushViewController(vc, animated: true)
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToDogList(source: dataStore!, destination: &destinationDS)
            navigateToDogList(source: viewController!, destination: vc as! DogListViewController )
        }
    }
    
     //MARK: Navigation
    func navigateToDogList(source: HomeViewController, destination: DogListViewController) {
        source.show(destination, sender: nil)
    }

}
