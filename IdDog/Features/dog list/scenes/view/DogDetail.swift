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
    
    open var delegate: DogDetailDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func setup(){
        if let url = URL(string: image!) {
            dogImage.af_setImage(withURL: url)
        }
    }
    
    @IBAction func tappedClose(_ sender: Any) {
        delegate?.dismiss()
    }
}
