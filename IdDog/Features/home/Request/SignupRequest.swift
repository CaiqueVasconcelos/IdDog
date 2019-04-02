//
//  SignupRequest.swift
//  IdDog
//
//  Created by Caique on 29/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

class SignupRequest: BaseRequest {

    required init() {
        super.init()
        endpoint = "https://api-iddog.idwall.co/signup"
        
    }
    convenience init(email: String) {
        self.init()
        
        body["email"] = email
    }
}
