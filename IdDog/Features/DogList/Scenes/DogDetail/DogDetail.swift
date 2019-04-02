//
//  DogDetail.swift
//  IdDog
//
//  Created by Caique on 01/04/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

protocol DogDetailDelegate {
    func dismiss()
}

class DogDetail: BaseViewController {
    @IBOutlet weak var dogImage: UIImageView!
    var image: String?
    var interactor: DogDetailBusinessLogic?
    var router: (NSObjectProtocol & DogDetailRoutingLogic & DogDetailDataPassing)?
    
    open var delegate: DogDetailDelegate?
    
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
//        setup()
        
        if let url = URL(string: router?.dataStore?.dogImage ?? "") {
            dogImage.af_setImage(withURL: url)
//            dogImage.adjustsImageSizeForAccessibilityContentSizeCategory
            dogImage.contentMode = .scaleAspectFit
            
        }
    }
        // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = DogDetailInteractor()
        let router = DogDetailRouter()
//            let presenter = DogListPresenter()
        viewController.interactor = interactor
        viewController.router = router
//            interactor.presenter = presenter
//            presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor

    }
    
    @IBAction func tappedClose(_ sender: Any) {
//        delegate?.dismiss()
        router?.routeToDogList(segue: nil)
    }
}
