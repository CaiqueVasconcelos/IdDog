//
//  DogDetailInteractor.swift
//  IdDog
//
//  Created by Caique on 02/04/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

protocol DogDetailBusinessLogic
{
//    func doSomething(request: ___VARIABLE_sceneName___.Something.Request)
}

protocol DogDetailDataStore
{
    var dogImage: String { get set }
}

class DogDetailInteractor: DogDetailBusinessLogic, DogDetailDataStore {
    var dogImage = ""
    
//    var presenter: ___VARIABLE_sceneName___PresentationLogic?
//    var worker: ___VARIABLE_sceneName___Worker?
    //var name: String = ""
    
    // MARK: Do something
    
//    func doSomething(request: ___VARIABLE_sceneName___.Something.Request)
//    {
//        worker = ___VARIABLE_sceneName___Worker()
//        worker?.doSomeWork()
//
//        let response = ___VARIABLE_sceneName___.Something.Response()
//        presenter?.presentSomething(response: response)
//    }
}
