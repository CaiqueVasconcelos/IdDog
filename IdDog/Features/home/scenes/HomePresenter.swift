//
//  HomePresenter.swift
//  IdDog
//
//  Created by Caique on 29/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

protocol HomePresentationLogic {
    func presentSignResult(response: Home.validateSign.Response)
}

class HomePresenter: HomePresentationLogic {
    weak var viewController: HomeDisplayLogic?
    
    func presentSignResult(response: Home.validateSign.Response) {
        if let error = response.erro {
            viewController?.displayError(error: error)
            return
        }
        var viewModel = Home.validateSign.ViewModel()
        viewModel.response = response.response
        viewController?.displaySignResult(viewModel: viewModel)
    }
}
