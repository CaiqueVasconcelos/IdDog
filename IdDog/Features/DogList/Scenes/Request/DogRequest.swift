//
//  DogRequest.swift
//  IdDog
//
//  Created by Caique on 31/03/19.
//  Copyright © 2019 Vasconcelos. All rights reserved.
//

import UIKit

class DogRequest: BaseRequest {

    required init() {
        super.init()
        endpoint = "https://api-iddog.idwall.co/feed"
        
    }
    convenience init(authorization: String, category: String) {
        self.init()
        
        headers["Authorization"] = authorization
        endpoint = "https://api-iddog.idwall.co/feed?category="+category
    }
}
