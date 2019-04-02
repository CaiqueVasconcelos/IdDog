//
//  DogListPresenter.swift
//  IdDog
//
//  Created by Caique on 31/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

protocol DogListPresentationLogic {
    func presentDogResult(response: DogList.dogs.Response)
}

class DogListPresenter: DogListPresentationLogic {
    weak var viewController: DogListDisplayLogic?
    var viewModel = DogList.dogs.ViewModel()
    
    func presentDogResult(response: DogList.dogs.Response) {
        if let error = response.erro {
            viewController?.displayError(error: error)
            return
        }
        viewModel.dogs.append(response.response!)
        viewModel.dog = response.response
        viewController?.displayDogs(viewModel: viewModel)
    }

}
