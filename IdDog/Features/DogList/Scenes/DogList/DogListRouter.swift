//
//  DogListRouter.swift
//  IdDog
//
//  Created by Caique on 31/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

@objc protocol DogListRoutingLogic {
    func routeToDogDetail(segue: UIStoryboardSegue?)
}

protocol DogDataPassing {
    var dataStore: DogListDataStore? { get }
}

class DogListRouter: NSObject, DogListRoutingLogic, DogDataPassing {

    weak var viewController: DogListViewController?
    var dataStore: DogListDataStore?
    
    func routeToDogDetail(segue: UIStoryboardSegue?) {
        
        if let segue = segue {
            let destinationVC = segue.destination as! DogDetail
            var destinationDS = destinationVC.router!.dataStore!//dataStore!
            passDataToDogDetail(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "DogList", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "DogDetail") as! DogDetail
            var destinationDS = destinationVC.router!.dataStore!
            passDataToDogDetail(source: dataStore!, destination: &destinationDS)
            navigateToDogDetail(source: viewController!, destination: destinationVC)
        }
    }
    
    // MARK: Navigation
    func passDataToDogDetail(source: DogListDataStore, destination: inout DogDetailDataStore) {
        destination.dogImage = source.selectedImage
    }
    // MARK: Passing data
    func navigateToDogDetail(source: DogListViewController, destination: DogDetail) {
        source.show(destination, sender: nil)
    }
    
}
