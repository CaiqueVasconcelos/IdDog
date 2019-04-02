//
//  DogListInteractor.swift
//  IdDog
//
//  Created by Caique on 31/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

protocol DogListBusinessLogic {
    func listDogs(request: DogList.dogs.Request)
    func validateSelection(category: String,dogs: [Dog])
}

protocol DogListDataStore {
    var dog: Dog { get set }
}

class DogListInteractor: DogListBusinessLogic, DogListDataStore {
    
    var dog = Dog()
    var presenter: DogListPresenter?
    var worker: DogListWorker?
    
    func listDogs(request: DogList.dogs.Request) {
        let request = DogList.dogs.Request(token: request.token, category: request.category)
        worker = DogListWorker()
        worker?.listDogs(request: request, { (response) in
//            self.downloadImages(response: response)
            self.presenter?.presentDogResult(response: response)
        })
    }
    func validateSelection(category: String,dogs: [Dog]) {
        var dog: Dog?
        dogs.forEach({ (dogList) in
            if dogList.category == category {
                dog = dogList
            }
        })
        if dog != nil {
            self.presenter?.presentDogResult(response: DogList.dogs.Response(erro: nil, response: dog))
        } else {
            listDogs(request: DogList.dogs.Request(token: Session.token, category:category))
        }
    }
}
