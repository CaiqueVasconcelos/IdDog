//
//  BaseViewController.swift
//  IdDog
//
//  Created by Caique on 29/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    internal var loading: UIView!
    internal var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoading()
    }
    
    func showMessage(_ title: String = "Alerta", buttonTitle: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func showLoading(){
        if loading == nil {
            setupLoading()
        }
        
        if !isLoading {
            loading.isHidden = false
            //            present(loading, animated: true, completion: nil)
            isLoading = !isLoading
        } else {
            //            dismiss(animated: false, completion: nil)
            loading.isHidden = true
            isLoading = !isLoading
        }
    }
    private func setupLoading(){
        
        loading = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        loading.alpha = 0.7
        loading.isHidden = true
        //        loading.layer.zPosition = 9999
        loading.backgroundColor = UIColor.black
        loading.isUserInteractionEnabled = true
        loading.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: loading.center.x, y: loading.center.y, width: 50, height: 50))
        //        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.center = CGPoint(x: loading.center.x, y: loading.center.y)
        loadingIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        loadingIndicator.startAnimating();
        
        loading.addSubview(loadingIndicator)
        
        self.navigationController?.view.addSubview(loading)
        self.navigationController?.view.bringSubviewToFront(loading)
    }
}
