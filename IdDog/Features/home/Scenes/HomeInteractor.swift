//
//  HomeInteractor.swift
//  IdDog
//
//  Created by Caique on 29/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

protocol HomeBusinessLogic {
    func validateSignup(request: Home.validateSign.Request)
}

protocol HomeDataStore {
    var email: String { get set }
}


class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    var email: String = ""
    
    var presenter: HomePresenter?
    var worker: HomeWorker?
    
    func validateSignup(request: Home.validateSign.Request) {
        let request = Home.validateSign.Request(email: request.email)
        worker = HomeWorker()
        worker?.validateSignup(request: request, { (response) in
            self.presenter?.presentSignResult(response: response)
        })
    }
}
