//
//  HomeViewController.swift
//  IdDog
//
//  Created by Caique on 29/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: class {
    func displaySignResult(viewModel: Home.validateSign.ViewModel)
    func displayError(error: String)
}

class HomeViewController: BaseViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnConfirma: UIButton!
    
    
    
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    
    // MARK: Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
//        txtEmail.addTarget(self, action: #selector(validateEmail), for: .editingDidEnd)
    }
    
    internal func validateEmail() {
        
    }
    

    @IBAction func tappedConfirma(_ sender: Any) {
        var request = Home.validateSign.Request()
        request.email = txtEmail.text
        self.showLoading()
        interactor?.validateSignup(request: request)
    }
    
    // MARK: Routing
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
}

extension HomeViewController: HomeDisplayLogic {
    func displaySignResult(viewModel: Home.validateSign.ViewModel) {
        self.showLoading()
        router?.routeToDogList(segue: nil)
    }
    
    func displayError(error: String) {
        self.showLoading()
        showMessage(buttonTitle: "OK", message: error)
    }
}
