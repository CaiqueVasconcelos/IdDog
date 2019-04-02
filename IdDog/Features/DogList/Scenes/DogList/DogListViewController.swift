//
//  DogListViewController.swift
//  IdDog
//
//  Created by Caique on 30/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

protocol DogListDisplayLogic: class {
    func displayDogs(viewModel: DogList.dogs.ViewModel)
    func displayError(error: String)
}
class DogListViewController: BaseViewController, UIPickerViewDataSource,UIPickerViewDelegate {

    var interactor: DogListBusinessLogic?
    var router: (NSObjectProtocol & DogListRoutingLogic & DogDataPassing)?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectCategory: UITextField!
    
    var dogDataStore: Dog?
    var dogsDataStore: [Dog]?
    var seletor = 0
    
    fileprivate var pickerOverlay: UIView!
    fileprivate var flagPicker: UIPickerView!
    var categorias: [String] = ["husky","hound","pug","labrador"]
    
    
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
        self.tableView.dataSource = self
        self.tableView.delegate = self
        showLoading()
        interactor?.listDogs(request: DogList.dogs.Request(token:Session.token, category: ""))
        let thePicker = UIPickerView()
        selectCategory.inputView = thePicker
        thePicker.delegate = self
    }
    
    // MARK: Setup
    private func setup() {
        let viewController = self
        let interactor = DogListInteractor()
        let router = DogListRouter()
        let presenter = DogListPresenter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
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
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categorias.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categorias[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        pickerView.isHidden = true
        showLoading()
        self.view.endEditing(true)
        interactor?.validateSelection(category: categorias[row], dogs: dogsDataStore!)
    }
}
extension DogListViewController: DogListDisplayLogic {
    func displayDogs(viewModel: DogList.dogs.ViewModel) {
        self.showLoading()
        dogDataStore = viewModel.dog
        dogsDataStore = viewModel.dogs
        self.selectCategory.placeholder = dogDataStore?.category
        self.tableView.reloadData()
        self.navigationController?.navigationBar.backItem?.title = "Voltar"
    }
    
    func displayError(error: String) {
        self.showLoading()
        showMessage(buttonTitle: "OK", message: error)
    }
}
extension DogListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogDataStore?.urlList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell")else {
            return UITableViewCell()
        }
        let url = URL(string: dogDataStore?.urlList?[indexPath.row] ?? "")
        cell.imageView?.af_setImage(withURL: url!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.selectImage(image: dogDataStore!.urlList![indexPath.row])
        router?.routeToDogDetail(segue: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
}
extension DogListViewController: DogDetailDelegate {
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}
