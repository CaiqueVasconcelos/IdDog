//
//  DogDetailRouter.swift
//  IdDog
//
//  Created by Caique on 02/04/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit
@objc protocol DogDetailRoutingLogic {
    func routeToDogList(segue: UIStoryboardSegue?)
}

protocol DogDetailDataPassing {
    var dataStore: DogDetailDataStore? { get }
}

class DogDetailRouter: NSObject, DogDetailRoutingLogic, DogDetailDataPassing {
    var dataStore: DogDetailDataStore?
    weak var viewController: DogDetail?
    
    func routeToDogList(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! DogListViewController
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToDogDetail(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "DogList", bundle: nil)
//            let destinationVC = storyboard.instantiateViewController(withIdentifier: "showDogDetail") as!
//            var destinationDS = destinationVC.router!.dataStore!
//            passDataToDogDetail(source: dataStore!, destination: &destinationDS)
            navigateToDogList(source: viewController!)
        }
    }
    // MARK: Passing data
    func navigateToDogList(source: DogDetail) {
        source.dismiss(animated: false)
    }

}
