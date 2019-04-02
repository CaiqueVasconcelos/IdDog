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
        
    }
}
